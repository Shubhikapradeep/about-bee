import { defineConfig } from 'vite'
import { svelte } from '@sveltejs/vite-plugin-svelte'
export default defineConfig({
  base: '/about-bee/', 
  plugins: [svelte()],
})