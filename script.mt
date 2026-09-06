// script.js - NEXURA | Muhammad Taqi - Complete Dynamic Website

// ============================================
// 1. GOOGLE FONT LOADING
// ============================================
(function loadGoogleFont() {
    const fontLink = document.createElement('link');
    fontLink.rel = 'preconnect';
    fontLink.href = 'https://fonts.googleapis.com';
    document.head.appendChild(fontLink);

    const fontLink2 = document.createElement('link');
    fontLink2.rel = 'preconnect';
    fontLink2.href = 'https://fonts.gstatic.com';
    fontLink2.crossOrigin = 'anonymous';
    document.head.appendChild(fontLink2);

    const fontLink3 = document.createElement('link');
    fontLink3.rel = 'stylesheet';
    fontLink3.href = 'https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;700&display=swap';
    document.head.appendChild(fontLink3);
})();

// ============================================
// 2. GOOGLE SITE VERIFICATION META TAG
// ============================================
(function addGoogleVerification() {
    const metaTag = document.createElement('meta');
    metaTag.name = 'google-site-verification';
    metaTag.content = '1NRG9AxOq3yo2406lyqzessDKTQD1ikumDe8GtKsUpg';
    document.head.appendChild(metaTag);
})();

// ============================================
// 3. CHARSET & VIEWPORT META TAGS
// ============================================
(function addMetaTags() {
    const charsetMeta = document.createElement('meta');
    charsetMeta.charset = 'UTF-8';
    document.head.appendChild(charsetMeta);

    const viewportMeta = document.createElement('meta');
    viewportMeta.name = 'viewport';
    viewportMeta.content = 'width=device-width, initial-scale=1.0';
    document.head.appendChild(viewportMeta);
})();

// ============================================
// 4. FAVICON
// ============================================
(function addFavicon() {
    const favicon = document.createElement('link');
    favicon.rel = 'icon';
    favicon.href = 'https://yt3.ggpht.com/CRdTHCDMWDNbc75cMKKKoII4H_7L6kPB2gRcErgF1IBc7-7uat6PU7BhqaagjgPNUMODFGxudm2A_6s=s953-c-fcrop64=1,13160000ece9ffff-rw-nd-v1';
    document.head.appendChild(favicon);
})();

// ============================================
// 5. CSS STYLES
// ============================================
(function injectStyles() {
    const style = document.createElement('style');
    style.textContent = `
        @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;700&display=swap');

        :root {
            --neon-blue: #00f2ff;
            --bg: #050505;
            --glass: rgba(255, 255, 255, 0.05);
        }

        body {
            margin: 0;
            background: var(--bg);
            color: white;
            font-family: 'Outfit', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            box-sizing: border-box;
        }

        .card {
            background: var(--glass);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid var(--neon-blue);
            padding: 40px;
            border-radius: 30px;
            text-align: center;
            max-width: 500px;
            width: 100%;
            box-shadow: 0 10px 40px rgba(0, 242, 255, 0.15);
        }

        .image-frame {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 3px solid var(--neon-blue);
            margin: 0 auto 20px auto;
            overflow: hidden;
            box-shadow: 0 0 20px var(--neon-blue);
        }

        .image-frame img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }

        h1 {
            margin: 0;
            color: var(--neon-blue);
            font-size: 2.5rem;
            letter-spacing: 2px;
        }

        h2 {
            font-weight: 300;
            font-size: 1rem;
            opacity: 0.8;
            margin-bottom: 20px;
            letter-spacing: 1px;
        }

        .role-box {
            background: rgba(0, 0, 0, 0.4);
            padding: 15px;
            border-radius: 15px;
            margin-bottom: 25px;
            font-size: 0.9rem;
            line-height: 1.6;
            border: 1px solid rgba(0, 242, 255, 0.3);
        }

        .btn {
            display: block;
            width: 100%;
            padding: 15px;
            background: var(--neon-blue);
            color: black;
            border-radius: 10px;
            font-weight: 700;
            text-decoration: none;
            margin-bottom: 10px;
            transition: 0.3s;
            border: none;
            cursor: pointer;
            font-family: 'Outfit', sans-serif;
            font-size: 1rem;
            box-sizing: border-box;
        }

        .btn:hover {
            transform: scale(1.02);
            box-shadow: 0 0 20px var(--neon-blue);
        }

        #voice-status {
            margin-top: 15px;
            font-size: 0.8rem;
            color: var(--neon-blue);
            height: 20px;
            min-height: 20px;
        }

        /* Mobile Responsive */
        @media (max-width: 600px) {
            .card {
                padding: 25px 20px;
                border-radius: 20px;
            }
            
            h1 {
                font-size: 2rem;
            }
            
            .image-frame {
                width: 120px;
                height: 120px;
            }
            
            .btn {
                padding: 12px;
                font-size: 0.9rem;
            }
        }
    `;
    document.head.appendChild(style);
})();

// ============================================
// 6. BUILD HTML STRUCTURE
// ============================================
(function buildStructure() {
    const card = document.createElement('div');
    card.className = 'card';

    // Image Frame
    const imageFrame = document.createElement('div');
    imageFrame.className = 'image-frame';
    const img = document.createElement('img');
    img.src = 'https://yt3.ggpht.com/CRdTHCDMWDNbc75cMKKKoII4H_7L6kPB2gRcErgF1IBc7-7uat6PU7BhqaagjgPNUMODFGxudm2A_6s=s953-c-fcrop64=1,13160000ece9ffff-rw-nd-v1';
    img.alt = 'Muhammad Taqi';
    imageFrame.appendChild(img);
    card.appendChild(imageFrame);

    // Heading 1
    const h1 = document.createElement('h1');
    h1.textContent = 'NEXURA';
    card.appendChild(h1);

    // Heading 2
    const h2 = document.createElement('h2');
    h2.textContent = 'Muhammad Taqi';
    card.appendChild(h2);

    // Role Box
    const roleBox = document.createElement('div');
    roleBox.className = 'role-box';
    roleBox.innerHTML = 'Full Stack Web & AI Developer<br>Software Architect & Engineer<br>Python & React Programmer';
    card.appendChild(roleBox);

    // Button 1 - Nexura App Store
    const btn1 = document.createElement('a');
    btn1.href = 'https://sites.google.com/view/nexura-app-store/home';
    btn1.className = 'btn';
    btn1.textContent = 'NEXURA APP STORE';
    btn1.target = '_blank';
    btn1.rel = 'noopener noreferrer';
    card.appendChild(btn1);

    // Button 2 - Nexura Official
    const btn2 = document.createElement('a');
    btn2.href = 'https://sites.google.com/view/nexura-mt/home';
    btn2.className = 'btn';
    btn2.textContent = 'NEXURA OFFICIAL';
    btn2.target = '_blank';
    btn2.rel = 'noopener noreferrer';
    card.appendChild(btn2);

    // Voice Status Div
    const voiceStatus = document.createElement('div');
    voiceStatus.id = 'voice-status';
    card.appendChild(voiceStatus);

    document.body.appendChild(card);
})();

// ============================================
// 7. VOICE RECOGNITION FUNCTIONALITY
// ============================================
(function initVoiceRecognition() {
    window.startVoice = function() {
        const status = document.getElementById('voice-status');
        const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
        
        if (!SpeechRecognition) {
            status.innerText = 'Speech Recognition not supported.';
            return;
        }

        const recognition = new SpeechRecognition();
        recognition.lang = 'en-US';
        recognition.interimResults = false;
        recognition.maxAlternatives = 1;

        recognition.onstart = () => {
            status.innerText = '🎤 Listening...';
            status.style.color = 'var(--neon-blue)';
        };

        recognition.onresult = (event) => {
            const transcript = event.results[0][0].transcript;
            status.innerText = '📝 Input: ' + transcript;
            status.style.color = 'white';
        };

        recognition.onerror = (event) => {
            let errorMessage = 'Error - Please try again';
            if (event.error === 'not-allowed') {
                errorMessage = '🔇 Microphone access denied. Please allow microphone permission.';
            } else if (event.error === 'no-speech') {
                errorMessage = '🔇 No speech detected. Please try again.';
            } else if (event.error === 'network') {
                errorMessage = '📡 Network error. Check your internet connection.';
            }
            status.innerText = errorMessage;
            status.style.color = '#ff6b6b';
        };

        recognition.onend = () => {
            if (status.innerText === '🎤 Listening...') {
                status.innerText = 'Voice recognition ended.';
                status.style.color = 'var(--neon-blue)';
            }
        };

        recognition.start();
    };
})();

// ============================================
// 8. ADD DOUBLE-CLICK TO START VOICE
// ============================================
(function addDoubleClickVoice() {
    document.addEventListener('dblclick', function(e) {
        // Prevent double-click on links
        if (e.target.closest('.btn')) {
            return;
        }
        if (window.startVoice) {
            window.startVoice();
        }
    });
    
    console.log('💡 Tip: Double-click anywhere on the page to start voice recognition!');
})();

// ============================================
// 9. CLOUDFLARE BEACON (Analytics)
// ============================================
(function loadCloudflareBeacon() {
    const beacon = document.createElement('script');
    beacon.type = 'module';
    beacon.src = 'https://static.cloudflareinsights.com/beacon.min.js/v4513226cdae34746b4dedf0b4dfa099e1781791509496';
    beacon.integrity = 'sha512-ZE9pZaUXND66v380QUtch/5sE9tPFh2zg45pR2PB0CVkCtOREv2AJKkSidISWkysEuQ0EH8faUU5du78bx87UQ==';
    beacon.crossOrigin = 'anonymous';
    beacon.setAttribute('data-cf-beacon', '{"version":"2024.11.0","token":"e3c1c9af36de41759418005494a48906","r":1,"server_timing":{"name":{"cfCacheStatus":true,"cfEdge":true,"cfExtPri":true,"cfL4":true,"cfOrigin":true,"cfSpeedBrain":true},"location_startswith":null}}');
    document.head.appendChild(beacon);
})();

// ============================================
// 10. PAGE LOAD COMPLETE NOTIFICATION
// ============================================
window.addEventListener('DOMContentLoaded', function() {
    console.log('%c⚡ NEXURA | Muhammad Taqi ⚡', 'color: #00f2ff; font-size: 20px; font-weight: bold;');
    console.log('%c🚀 Website loaded successfully!', 'color: #00f2ff; font-size: 14px;');
    console.log('%c💡 Double-click anywhere to activate voice recognition.', 'color: #00f2ff; font-size: 12px;');
});
