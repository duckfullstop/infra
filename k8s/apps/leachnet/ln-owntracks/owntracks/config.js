window.owntracks = window.owntracks || {};
const startDateTime = new Date();
startDateTime.setDate(startDateTime.getDate() - 1);
window.owntracks.config = {
    locale: 'en-GB',
    selectedUser: 'duck',
    startDateTime,
};