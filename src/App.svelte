<script>
  import { onMount } from 'svelte';
  import HexCard from './lib/Hexcard.svelte';
  import ProjectCard from './lib/Projectcard.svelte';
  import SkillBadge from './lib/Skillbadge.svelte';

  let currentSection = 'about';
  let isVisible = false;

  const skills = [
    'Python', 'HTML', 'CSS', 'JavaScript', 'R', 'MySQL', 'C',
    'TensorFlow', 'PyTorch', 'Zapier', 'Botpress', 'Machine Learning'
  ];

  const projects = [
    {
      title: 'Mental Health Therapy AI Chatbot',
      description: 'AI-powered chatbot for mental health support using advanced NLP',
      tech: ['Python', 'TensorFlow', 'Botpress']
    },
    {
      title: 'Mapeer - Sustainable Commute App',
      description: 'App promoting eco-friendly transportation choices',
      tech: ['JavaScript', 'HTML', 'CSS']
    },
    {
      title: 'Math Graduates Decline Analysis',
      description: 'Data science project with interactive website visualization',
      tech: ['R', 'Data Visualization', 'HTML']
    },
    {
      title: 'Stock Market Prediction System',
      description: 'ML-based stock market prediction using R and neural networks',
      tech: ['R', 'Neural Networks', 'Machine Learning']
    },
    {
      title: 'PSJ5 Murder Mystery Game',
      description: 'Interactive game with animation and audio elements',
      tech: ['JavaScript', 'HTML', 'CSS', 'Audio/Animation']
    },
    {
      title: 'ADHD Focus Tool',
      description: 'Productivity tool designed for ADHD management',
      tech: ['JavaScript', 'HTML', 'CSS']
    }
  ];

  const funFacts = [
    "🐝 I'm absolutely obsessed with bees and their amazing social structures",
    "🎵 Concert enthusiast - I've been to over 20 live shows this year",
    "🎮 I've created multiple Tetris clones because why stop at one?",
    "🤖 I build AI tools for mental health and healing",
    "📎 I wear claw clips like it's a personality trait (because it is)",
    "🧠 I'm passionate about using tech to help people with ADHD",
    "🌱 Won an award for my sustainability awareness website",
    "📚 Teaching lead at Stanford Code in Place",
    "🎓 Harvard Manage Mentor certificate holder",
    "🎯 Shortlisted for a game development internship"
  ];

  onMount(() => {
    isVisible = true;
  });

  function scrollToSection(section) {
    currentSection = section;
    document.getElementById(section).scrollIntoView({ behavior: 'smooth' });
  }
</script>

<main class="app">
  <nav class="navbar">
    <div class="nav-container">
      <div class="logo">🐝 Shubhika's Hive</div>
      <ul class="nav-links">
        <li><button on:click={() => scrollToSection('about')}>About</button></li>
        <li><button on:click={() => scrollToSection('journey')}>Journey</button></li>
        <li><button on:click={() => scrollToSection('projects')}>Projects</button></li>
        <li><button on:click={() => scrollToSection('skills')}>Skills</button></li>
        <li><button on:click={() => scrollToSection('fun-facts')}>Fun Facts</button></li>
        <li><button on:click={() => scrollToSection('contact')}>Contact</button></li>
      </ul>
    </div>
  </nav>

  <section id="about" class="hero-section">
    <div class="hero-content" class:visible={isVisible}>
      <div class="hero-text">
        <h1>Hi, I'm Shubhika 🐝</h1>
        <p class="tagline">Code with care. Build like it matters.</p>
        <p class="bio">
          From ADHD tools to concerts & chaos, my hive holds my life in tech. 
          I'm passionate about creating meaningful technology that helps people, 
          especially in mental health and accessibility.
        </p>
        <div class="hero-buttons">
          <button class="cta-button primary" on:click={() => scrollToSection('projects')}>
            See My Work 🍯
          </button>
          <button class="cta-button secondary" on:click={() => scrollToSection('contact')}>
            Let's Connect 📬
          </button>
        </div>
      </div>
      <div class="hero-image">
        <div class="bee-animation">
          <div class="hexagon-container">
            <div class="hexagon">
              <div class="hexagon-inner">
                <span class="bee-emoji">🐝</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section id="journey" class="section">
    <HexCard title="My Coding Journey 🚀">
      <div class="journey-content">
        <div class="timeline-item">
          <h3>2023 - The Beginning</h3>
          <p>Started with Python at Kode with Klossy (KWK)</p>
        </div>
        <div class="timeline-item">
          <h3>2024 - Expanding Horizons</h3>
          <p>Dove into web development with HTML, CSS, JavaScript</p>
          <p>Explored data science with R and neural networks</p>
        </div>
        <div class="timeline-item">
          <h3>2025 - Advanced ML & Quantum</h3>
          <p>Currently studying ML, quantum physics, and advanced AI at PESU</p>
          <p>Building therapy bots and accessibility tools</p>
        </div>
      </div>
    </HexCard>
  </section>

  <section id="projects" class="section">
    <div class="container">
      <h2>My Projects 🍯</h2>
      <div class="projects-grid">
        {#each projects as project}
          <ProjectCard {project} />
        {/each}
      </div>
    </div>
  </section>

  <section id="skills" class="section">
    <HexCard title="Technical Skills 🔧">
      <div class="skills-container">
        {#each skills as skill}
          <SkillBadge {skill} />
        {/each}
      </div>
    </HexCard>
  </section>

  <section id="fun-facts" class="section">
    <HexCard title="Fun Facts About Me 🌼">
      <div class="fun-facts-grid">
        {#each funFacts as fact}
          <div class="fact-item">
            <p>{fact}</p>
          </div>
        {/each}
      </div>
    </HexCard>
  </section>

  <section id="contact" class="section">
    <HexCard title="Buzz Me 📬">
      <div class="contact-content">
        <p>Ready to collaborate or just want to chat about bees and code?</p>
        <div class="contact-links">
          <a href="https://github.com/Shubhikapradeep" target="_blank" class="contact-link">
            GitHub 🐙
          </a>
          <a href="https://linkedin.com/in/shubhika-pradeep" target="_blank" class="contact-link">
            LinkedIn 💼
          </a>
          <a href="mailto:shubhika@example.com" class="contact-link">
            Email 📧
          </a>
        </div>
      </div>
    </HexCard>
  </section>
</main>

<style>
  :global(body) {
    margin: 0;
    font-family: 'Press Start 2P', monospace;
    background-color: #1a0f0a;
    background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="86.6"><polygon points="50,0 100,25 100,75 50,100 0,75 0,25" fill="none" stroke="%23f9c74f" stroke-width="0.5"/></svg>');
    color: #fff9db;
    scroll-behavior: smooth;
    line-height: 1.6;
  }

  .app {
    min-height: 100vh;
  }

  .navbar {
    position: fixed;
    top: 0;
    width: 100%;
    background-color: rgba(44, 24, 12, 0.95);
    backdrop-filter: blur(10px);
    z-index: 1000;
    padding: 1rem 0;
  }

  .nav-container {
    max-width: 1200px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 2rem;
  }

  .logo {
    font-size: 1.2rem;
    color: #f9c74f;
    font-weight: bold;
  }

  .nav-links {
    display: flex;
    list-style: none;
    gap: 2rem;
    margin: 0;
    padding: 0;
  }

  .nav-links button {
    background: none;
    border: none;
    color: #f9c74f;
    font-family: inherit;
    font-size: 0.8rem;
    cursor: pointer;
    padding: 0.5rem 1rem;
    border-radius: 4px;
    transition: all 0.3s ease;
  }

  .nav-links button:hover {
    background-color: rgba(249, 199, 79, 0.2);
    transform: translateY(-2px);
  }

  .hero-section {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 8rem 2rem 4rem;
  }

  .hero-content {
    max-width: 1200px;
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 4rem;
    align-items: center;
    opacity: 0;
    transform: translateY(50px);
    transition: all 1s ease;
  }

  .hero-content.visible {
    opacity: 1;
    transform: translateY(0);
  }

  .hero-text h1 {
    font-size: 3rem;
    margin-bottom: 1rem;
    background: linear-gradient(45deg, #f9c74f, #f8961e);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
  }

  .tagline {
    font-size: 1.2rem;
    color: #f9c74f;
    margin-bottom: 1.5rem;
  }

  .bio {
    font-size: 1rem;
    line-height: 1.8;
    margin-bottom: 2rem;
    color: #fff9db;
  }

  .hero-buttons {
    display: flex;
    gap: 1rem;
    flex-wrap: wrap;
  }

  .cta-button {
    padding: 1rem 2rem;
    border: none;
    border-radius: 8px;
    font-family: inherit;
    font-size: 1rem;
    cursor: pointer;
    transition: all 0.3s ease;
    text-decoration: none;
    display: inline-block;
  }

  .cta-button.primary {
    background: linear-gradient(45deg, #f9c74f, #f8961e);
    color: #1a0f0a;
  }

  .cta-button.secondary {
    background: transparent;
    color: #f9c74f;
    border: 2px solid #f9c74f;
  }

  .cta-button:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(249, 199, 79, 0.3);
  }

  .hero-image {
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .bee-animation {
    position: relative;
  }

  .hexagon-container {
    width: 300px;
    height: 300px;
    position: relative;
    animation: float 3s ease-in-out infinite;
  }

  .hexagon {
    width: 100%;
    height: 100%;
    clip-path: polygon(50% 0%, 93% 25%, 93% 75%, 50% 100%, 7% 75%, 7% 25%);
    background: linear-gradient(45deg, #f9c74f, #f8961e);
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
  }

  .hexagon-inner {
    width: 90%;
    height: 90%;
    clip-path: polygon(50% 0%, 93% 25%, 93% 75%, 50% 100%, 7% 75%, 7% 25%);
    background-color: #1a0f0a;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .bee-emoji {
    font-size: 5rem;
    animation: buzz 2s ease-in-out infinite;
  }

  @keyframes float {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-20px); }
  }

  @keyframes buzz {
    0%, 100% { transform: scale(1); }
    50% { transform: scale(1.1); }
  }

  .section {
    padding: 6rem 2rem;
    max-width: 1200px;
    margin: 0 auto;
  }

  .container {
    max-width: 1200px;
    margin: 0 auto;
  }

  .section h2 {
    text-align: center;
    font-size: 2.5rem;
    margin-bottom: 3rem;
    color: #f9c74f;
  }

  .projects-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 2rem;
    margin-top: 2rem;
  }

  .journey-content {
    display: flex;
    flex-direction: column;
    gap: 2rem;
  }

  .timeline-item {
    padding: 1.5rem;
    background-color: rgba(249, 199, 79, 0.1);
    border-radius: 8px;
    border-left: 4px solid #f9c74f;
  }

  .timeline-item h3 {
    color: #f9c74f;
    margin-bottom: 0.5rem;
  }

  .skills-container {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
    justify-content: center;
  }

  .fun-facts-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 1.5rem;
  }

  .fact-item {
    background-color: rgba(249, 199, 79, 0.1);
    padding: 1.5rem;
    border-radius: 8px;
    border: 1px solid rgba(249, 199, 79, 0.3);
    transition: all 0.3s ease;
  }

  .fact-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(249, 199, 79, 0.2);
  }

  .contact-content {
    text-align: center;
  }

  .contact-links {
    display: flex;
    justify-content: center;
    gap: 2rem;
    margin-top: 2rem;
    flex-wrap: wrap;
  }

  .contact-link {
    display: inline-block;
    padding: 1rem 2rem;
    background-color: rgba(249, 199, 79, 0.1);
    color: #f9c74f;
    text-decoration: none;
    border-radius: 8px;
    border: 2px solid #f9c74f;
    transition: all 0.3s ease;
    font-family: inherit;
  }

  .contact-link:hover {
    background-color: #f9c74f;
    color: #1a0f0a;
    transform: translateY(-3px);
  }

  @media (max-width: 768px) {
    .hero-content {
      grid-template-columns: 1fr;
      text-align: center;
    }

    .hero-text h1 {
      font-size: 2rem;
    }

    .nav-links {
      flex-wrap: wrap;
      gap: 1rem;
    }

    .nav-links button {
      font-size: 0.7rem;
      padding: 0.3rem 0.8rem;
    }

    .hexagon-container {
      width: 200px;
      height: 200px;
    }

    .bee-emoji {
      font-size: 3rem;
    }

    .projects-grid {
      grid-template-columns: 1fr;
    }
  }
</style>