import consumer from "./consumer"

consumer.subscriptions.create("SupplementChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const jsondata = JSON.parse(data.content)
    console.log(jsondata)
    console.log(data)
    const html = `
                 <p>${jsondata.description}</p>
                 <p>${jsondata.location.attributes.name}</p>
                 <p>${jsondata.genre.attributes.name}</p>
                 <p>by ${jsondata.user.nickname}</p>
                 ------------------------------------           
                 `;
    const supplements = document.getElementById('supplements');
    const newSupplement = document.getElementById('supplement_description');
    const genreSupplement = document.getElementById('supplement_genre_id');
    const locationSupplement = document.getElementById('supplement_location_id');
    supplements.insertAdjacentHTML('afterbegin', html);
    newSupplement.value='';
    genreSupplement.value= '';
    locationSupplement.value='';
  }
});
