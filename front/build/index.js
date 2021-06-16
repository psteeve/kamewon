window.onload = function () {
    const input = document.getElementsByClassName('file-upload')[0];
    const submit = document.getElementsByClassName('submit')[0];

    submit.onclick = function (event) {
        event.preventDefault();
        console.log(input.files);
        const f = new FormData();

        [...input.files].forEach(file => f.append(f.name, file));

         fetch('/api/uploads', {
             method: 'POST',
             body: f
         });
    }
}
