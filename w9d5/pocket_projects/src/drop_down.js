
const dogs = {
  "Corgi": "https://www.akc.org/dogNames-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.Nameskc.org/dog-breeds/affenpinsche",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator() {
  const dogNames = Object.keys(dogs);
  const urls = Object.values(dogs);
  const dogLinks = [];
  for (let i = 0; i < dogNames.length; i++) {
    let a = document.createElement('a');
    a.innerHTML = dogNames[i];
    a.href = urls[i];
    let li = document.createElement('li');
    li.classList.add('dog-link');
    li.appendChild(a);
    dogLinks.push(li);
  }
  return dogLinks;
}

export const attachDogLinks = function() {
  const dogLinks = dogLinkCreator();
  
  const ul = document.querySelector(".drop-down-dog-list");
  dogLinks.forEach((li) => {
    ul.appendChild(li);
  } );
}

function handleEnter(e) {
  const ul = document.querySelector(".drop-down-dog-list");
  ul.classList.remove("hide");
}

function handleLeave(e) {
  const ul = document.querySelector(".drop-down-dog-list");
  ul.classList.add("hide");
}

const nav = document.querySelector(".drop-down-dog-nav");
nav.addEventListener('mouseenter', handleEnter);
nav.addEventListener('mouseleave', handleLeave);

attachDogLinks();

