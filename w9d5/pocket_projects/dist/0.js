(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[0],{

/***/ "./src/drop_down.js":
/*!**************************!*\
  !*** ./src/drop_down.js ***!
  \**************************/
/*! exports provided: attachDogLinks */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"attachDogLinks\", function() { return attachDogLinks; });\n\nconst dogs = {\n  \"Corgi\": \"https://www.akc.org/dogNames-breeds/cardigan-welsh-corgi/\",\n  \"Australian Shepherd\": \"https://www.akc.org/dog-breeds/australian-shepherd/\",\n  \"Affenpinscher\": \"https://www.Nameskc.org/dog-breeds/affenpinsche\",\n  \"American Staffordshire Terrier\": \"https://www.akc.org/dog-breeds/american-staffordshire-terrier/\",\n  \"Tosa\": \"https://www.akc.org/dog-breeds/tosa/\",\n  \"Labrador Retriever\": \"https://www.akc.org/dog-breeds/labrador-retriever/\",\n  \"French Bulldog\": \"https://www.akc.org/dog-breeds/french-bulldog/\" \n};\n\nfunction dogLinkCreator() {\n  const dogNames = Object.keys(dogs);\n  const urls = Object.values(dogs);\n  const dogLinks = [];\n  for (let i = 0; i < dogNames.length; i++) {\n    let a = document.createElement('a');\n    a.innerHTML = dogNames[i];\n    a.href = urls[i];\n    let li = document.createElement('li');\n    li.classList.add('dog-link');\n    li.appendChild(a);\n    dogLinks.push(li);\n  }\n  return dogLinks;\n}\n\nconst attachDogLinks = function() {\n  const dogLinks = dogLinkCreator();\n  \n  const ul = document.querySelector(\".drop-down-dog-list\");\n  dogLinks.forEach((li) => {\n    ul.appendChild(li);\n  } );\n}\n\nfunction handleEnter(e) {\n  const ul = document.querySelector(\".drop-down-dog-list\");\n  ul.classList.toggle(\"hide\");\n}\n\nfunction handleLeave(e) {\n  const ul = document.querySelector(\".drop-down-dog-list\");\n  ul.classList.toggle(\"hide\");\n}\n\nconst nav = document.querySelector(\".drop-down-dog-nav\");\nnav.addEventListener('mouseover', handleEnter);\n\nattachDogLinks();\n\n\n\n//# sourceURL=webpack:///./src/drop_down.js?");

/***/ })

}]);