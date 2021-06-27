const html = document.querySelector('html')
const setColorButton = document.createElement('button')
const navigationLinks=document.querySelectorAll('#navigation > dt')

//add a button as a first child
setColorButton.textContent='Color Mode'
setColorButton.classList.add('topButton', 'darkMode')
document.body.prepend(setColorButton)
//click on button adds a class to the html body
const toggleColorMode = () =>{
  html.classList.toggle('darkMode')
  document.body.classList.toggle('darkMode')
  setColorButton.classList.toggle('darkMode')
}
setColorButton.addEventListener('click', toggleColorMode)

//click on index item, triggers an event (shows sublinks)
function addShowLink(e){
  console.log(e.target)
  const element = e.target.nextElementSibling
  element.style.height=="0px"||element.style.height==0?
    element.style.height="auto":
    element.style.height="0px"

}
navigationLinks.forEach(link=>link.addEventListener("click", addShowLink))
