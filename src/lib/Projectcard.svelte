<script>
  export let project;
  
  import { onMount } from 'svelte';
  
  let visible = false;
  let cardElement;
  
  onMount(() => {
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          visible = true;
        }
      },
      { threshold: 0.1 }
    );
    
    if (cardElement) {
      observer.observe(cardElement);
    }
    
    return () => {
      if (cardElement) {
        observer.unobserve(cardElement);
      }
    };
  });
</script>

<div class="project-card" bind:this={cardElement} class:visible>
  <div class="project-header">
    <h3>{project.title}</h3>
  </div>
  <div class="project-content">
    <p>{project.description}</p>
    <div class="tech-stack">
      {#each project.tech as tech}
        <span class="tech-tag">{tech}</span>
      {/each}
    </div>
  </div>
  <div class="project-footer">
    <div class="project-icon">🚀</div>
  </div>
</div>

<style>
  .project-card {
    background: linear-gradient(135deg, #3a240c, #2c180c);
    border: 2px solid #f9c74f;
    border-radius: 16px;
    padding: 2rem;
    transition: all 0.6s ease;
    position: relative;
    overflow: hidden;
    opacity: 0;
    transform: translateY(30px) rotateX(10deg);
  }
  
  .project-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(249, 199, 79, 0.1), transparent);
    transition: left 0.5s ease;
  }
  
  .project-card.visible {
    opacity: 1;
    transform: translateY(0) rotateX(0deg);
  }
  
  .project-card:hover {
    transform: translateY(-10px) rotateX(5deg);
    box-shadow: 0 15px 40px rgba(249, 199, 79, 0.3);
    border-color: #f8961e;
  }
  
  .project-card:hover::before {
    left: 100%;
  }
  
  .project-header h3 {
    color: #f9c74f;
    margin-bottom: 1rem;
    font-size: 1.3rem;
  }
  
  .project-content p {
    color: #fff9db;
    margin-bottom: 1.5rem;
    line-height: 1.6;
  }
  
  .tech-stack {
    display: flex;
    flex-wrap: wrap;
    gap: 0.5rem;
    margin-bottom: 1rem;
  }
  
  .tech-tag {
    background-color: rgba(249, 199, 79, 0.2);
    color: #f9c74f;
    padding: 0.3rem 0.8rem;
    border-radius: 20px;
    font-size: 0.8rem;
    border: 1px solid rgba(249, 199, 79, 0.3);
  }
  
  .project-footer {
    display: flex;
    justify-content: center;
    align-items: center;
    padding-top: 1rem;
    border-top: 1px solid rgba(249, 199, 79, 0.3);
  }
  
  .project-icon {
    font-size: 2rem;
    animation: bounce 2s ease-in-out infinite;
  }
  
  @keyframes bounce {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-10px); }
  }
  
  @media (max-width: 768px) {
    .project-card {
      padding: 1.5rem;
    }
    
    .project-header h3 {
      font-size: 1.1rem;
    }
    
    .tech-tag {
      font-size: 0.7rem;
      padding: 0.2rem 0.6rem;
    }
  }
</style>