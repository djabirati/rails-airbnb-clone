import places from 'places.js';

const initAutocomplete = () => {
  // const addressInput = document.getElementById('address_user');
  const addressInput = document.getElementById('user_address');
  console.log(addressInput);
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
