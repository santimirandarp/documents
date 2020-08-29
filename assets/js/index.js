const html = document.querySelector('html')
const body = document.body
const button = document.createElement('button')
button.textContent='Color Mode'
button.classList.add('topButton', 'darkMode')
body.prepend(button)

const toggleColorMode = () =>{
  html.classList.toggle('darkMode')
  button.classList.toggle('darkMode')
}
button.addEventListener('click', toggleColorMode)
