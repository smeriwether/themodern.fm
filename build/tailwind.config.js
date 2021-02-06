module.exports = {
   purge: [
    './**/*.html.erb'
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
