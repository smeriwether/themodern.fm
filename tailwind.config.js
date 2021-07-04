module.exports = {
  purge: [
    './_includes/**/*.html',
    './_layouts/**/*.html',
    './_posts/*.md',
    './*.html',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        primary: '#FFFFFA',
        secondary: '#F5F4E9',
      },
      fontFamily: {
        rubik: ['Rubik', 'sans-serif'],
        merriweather: ['Merriweather', 'serif'],
      }
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
