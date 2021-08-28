document.addEventListener('DOMContentLoaded', function() {
  if ( document.getElementById('plan-image')){
    const ImageList = document.getElementById('image-list')

    
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div')
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length

      
      const blobImage = document.createElement('img')
      blobImage.setAttribute('src', blob)

      
      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id', `plan-image-${imageElementNum}`)
      inputHTML.setAttribute('name', 'plan[images][]')
      inputHTML.setAttribute('type', 'file')

      
      imageElement.appendChild(blobImage)
      imageElement.appendChild(inputHTML)
      ImageList.appendChild(imageElement)

      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      })
    }

    document.getElementById('plan-image').addEventListener('change', (e) => {
      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);

      createImageHTML(blob)

    });
  }
});
