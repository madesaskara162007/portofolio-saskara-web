document.getElementById('year').textContent = new Date().getFullYear();

const backendStatus = document.getElementById('backend-status');
const backendHostname = window.BACKEND_HOSTNAME || 'local-development';

if (backendStatus) {
	backendStatus.textContent = `Backend: ${backendHostname}`;
}
