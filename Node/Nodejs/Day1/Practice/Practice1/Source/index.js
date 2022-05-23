// Asynchronous and await

function resolveAfter() {
    return'Asynchronous';
  }
  
  async function asyncCall() {
    console.log('calling');
    const result = await resolveAfter();
    console.log(result);
    console.log('Ending');
  }
  
  asyncCall();
  