import base64

def create_hidden_button(button_text, secret_url):
    encoded_url = base64.b64encode(secret_url.encode('utf-8')).decode('utf-8')
    return f'''
    <button class="btn" onclick="openSecureLink('{encoded_url}')">{button_text}</button>
    '''

def run():
    # Secret links (Python file ke andar encapsulated)
    link_appstore = "https://sites.google.com/view/nexura-app-store/home"
    link_official = "https://sites.google.com/view/nexura-mt/home"

    btn_appstore = create_hidden_button("NEXURA APP STORE", link_appstore)
    btn_official = create_hidden_button("NEXURA OFFICIAL", link_official)

    profile_img = "https://yt3.ggpht.com/CRdTHCDMWDNbc75cMKKKoII4H_7L6kPB2gRcErgF1IBc7-7uat6PU7BhqaagjgPNUMODFGxudm2A_6s=s953-c-fcrop64=1,13160000ece9ffff-rw-nd-v1"

    return f"""
    <div class="card">
        <div class="image-frame">
            <img src="{profile_img}" alt="Muhammad Taqi">
        </div>
        
        <h1>NEXURA</h1>
        <h2>Muhammad Taqi</h2>
        
        <div class="role-box">
            Full Stack Web & AI Developer<br>
            Software Architect & Engineer<br>
            Python & React Programmer
        </div>

        {btn_appstore}
        {btn_official}

        <div id="voice-status"></div>
    </div>

    <script>
        function startVoice() {{
            const status = document.getElementById('voice-status');
            const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
            
            if (!SpeechRecognition) {{
                status.innerText = "Speech Recognition not supported.";
                return;
            }}

            const recognition = new SpeechRecognition();
            recognition.lang = 'en-US';
            recognition.onstart = () => {{ status.innerText = "Listening..."; }};
            recognition.onresult = (event) => {{
                const transcript = event.results[0][0].transcript;
                status.innerText = "Input: " + transcript;
            }};
            recognition.onerror = () => {{ status.innerText = "Error - Please try again"; }};
            recognition.start();
        }}
    </script>
    """
