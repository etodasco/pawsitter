document.querySelectorAll('.star-label').forEach(star => {
  star.addEventListener('mouseover', function() {
    let currentStar = parseInt(this.getAttribute('for').split('-')[1]);
    document.querySelectorAll('.star-label').forEach(s => {
      s.style.color = parseInt(s.getAttribute('for').split('-')[1]) <= currentStar ? 'gold' : '#ccc';
    });
  });

  star.addEventListener('mouseout', function() {
    document.querySelectorAll('.star-label').forEach(s => {
      s.style.color = '#ccc';
    });
  });
});
