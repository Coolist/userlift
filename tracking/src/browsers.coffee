try
  localStorage.setItem('_check', '_check');
  localStorage.removeItem('_check');
  browsersLocalStorage = true
catch
  browsersLocalStorage = false