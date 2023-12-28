document.addEventListener('DOMContentLoaded', function() {
    const themeToggleBtns = document.querySelectorAll('#theme-toggle');
    const studentTable = document.getElementById("data-table");

    const theme = localStorage.getItem('theme');
    if (theme) {
        document.body.classList.add(theme);
        studentTable.classList.toggle("table-dark", theme !== 'light-mode');
    }

    const handleThemeToggle = () => {
        const isLightMode = document.body.classList.contains('light-mode');
        document.body.classList.toggle('light-mode', !isLightMode);

        if (!isLightMode) {
            localStorage.setItem('theme', 'light-mode');
            studentTable.classList.remove("table-dark");
            localStorage.setItem('tableTheme', 'table-light');
        } else {
            localStorage.removeItem('theme');
            studentTable.classList.add("table-dark");
            localStorage.setItem('tableTheme', 'table-dark');
        }
    };

    themeToggleBtns.forEach(btn =>
        btn.addEventListener('click', handleThemeToggle)
    );
});
