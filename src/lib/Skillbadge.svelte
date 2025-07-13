<script>
  export let skill;
  
  import { onMount } from 'svelte';
  
  let visible = false;
  let badgeElement;
  
  const animationDelay = Math.random() * 0.5;
  
  onMount(() => {
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          setTimeout(() => {
            visible = true;
          }, animationDelay * 1000);
        }
      },
      { threshold: 0.1 }
    );
    
    if (badgeElement) {
      observer.observe(badgeElement);
    }
    
    return () => {
      if (badgeElement) {
        observer.unobserve(badgeElement);
      }
    };
  });
</script>

<div class="skill-badge" bind:this={badgeElement} class:visible style="animation-delay: {animationDelay}s">
  <div class="skill-content">
    <span class="skill-name">{skill}</span>
  </div>
</div>

<style>
  .skill-badge {
    display: inline-block;
    background: linear-gradient(135deg, #f9c74f, #f8961e);
    color: #1a0f0a;
    padding: 1rem 1.5rem;
    border-radius: 25px;
    font-weight: bold;
    font-size: 0.9rem;
    box-shadow: 0 4px 15px rgba(249, 199, 79, 0.3);
    transition: all 0.4s ease;
    cursor: pointer;
    position: relative;
    overflow: hidden;
    opacity: 0;
    transform: translateY(20px) scale(0.8);
  }
  
  .skill-badge::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
    transition: left 0.6s ease;
  }
  
  .skill-badge.visible {
    opacity: 1;
    transform: translateY(0) scale(1);
  }
  
  .skill-badge:hover {
    transform: translateY(-8px) scale(1.05);
    box-shadow: 0 8px 25px rgba(249, 199, 79, 0.5);
  }
  
  .skill-badge:hover::before {
    left: 100%;
  }
  
  .skill-content {
    position: relative;
    z-index: 1;
  }
  
  .skill-name {
    display: block;
    font-family: inherit;
  }
  
  @keyframes skillPulse {
    0%, 100% { transform: scale(1); }
    50% { transform: scale(1.05); }
  }
  
  .skill-badge:nth-child(even) {
    background: linear-gradient(135deg, #f8961e, #f9844a);
  }
  
  .skill-badge:nth-child(3n) {
    background: linear-gradient(135deg, #90e0ef, #0077b6);
    color: #fff;
  }
  
  .skill-badge:nth-child(4n) {
    background: linear-gradient(135deg, #43aa8b, #277da1);
    color: #fff;
  }
  
  @media (max-width: 768px) {
    .skill-badge {
      padding: 0.8rem 1.2rem;
      font-size: 0.8rem;
    }
  }