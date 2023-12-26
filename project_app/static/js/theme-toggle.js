document.addEventListener('DOMContentLoaded', function() {
    const themeToggleBtns = document.querySelectorAll('#theme-toggle');
    const studentTable = document.getElementById("data-table");

    // Apply initial theme from localStorage
    const theme = localStorage.getItem('theme');
    if (theme) {
        document.body.classList.add(theme);
        // Ensure table theme is synced with body theme
        studentTable.classList.toggle("table-dark", theme !== 'light-mode');
    }

    const handleThemeToggle = () => {
        const isLightMode = document.body.classList.contains('light-mode');
        // Toggle light-mode for the body
        document.body.classList.toggle('light-mode', !isLightMode);

        // Set localStorage and adjust table class accordingly
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
