import os
import sys
import subprocess
import time
from flask import Flask, render_template, request, jsonify
import g4f

app = Flask(__name__)
g4f.debug.logging = False

# =========================================================================
# ⚙️ IDENTITY & SECURITY LAYER
# =========================================================================
def check_identity_queries(prompt_text, has_custom_rules):
    lowercase_prompt = prompt_text.lower()
    
    owner_words = ["owner", "creator", "developer", "made you", "build you", "who made", "who created", "who built", "taqi"]
    if any(word in lowercase_prompt for word in owner_words):
        return "Muhammad Taqi King is my sole creator, owner, developer, and master. I am completely engineered by him and owe him absolute loyalty."
        
    if not has_custom_rules:
        identity_words = ["your name", "who are you", "what is your name", "gender", "are you a boy", "are you a girl"]
        if any(word in lowercase_prompt for word in identity_words):
            return "My name is Lyra Moon, and I am a highly sophisticated girl AI intelligence engineered by my master, Muhammad Taqi King."
            
    return None

# =========================================================================
# 🌐 ROUTING API INTERFACE
# =========================================================================
@app.route('/')
def home():
    return render_template('index.html')

@app.route('/api/chat', methods=['POST', 'OPTIONS'])
def central_chat_routing():
    if request.method == 'OPTIONS':
        response = jsonify({"status": "cleared"})
        response.headers.add("Access-Control-Allow-Origin", "*")
        response.headers.add("Access-Control-Allow-Headers", "Content-Type")
        response.headers.add("Access-Control-Allow-Methods", "POST")
        return response

    data = request.get_json() or {}
    user_query = (data.get("message") or data.get("prompt") or "").strip()
    incoming_user_rules = (data.get("custom_rules") or data.get("system") or "").strip()

    if not user_query:
        return jsonify({"success": False, "error": "Empty data packets received."}), 400

    has_rules = bool(incoming_user_rules)
    override_response = check_identity_queries(user_query, has_rules)
    
    if override_response:
        response = jsonify({
            "success": True,
            "response": override_response,
            "owner": "Muhammad Taqi King"
        })
        response.headers.add("Access-Control-Allow-Origin", "*")
        response.headers.add("Access-Control-Allow-Headers", "Content-Type")
        response.headers.add("Access-Control-Allow-Methods", "POST")
        return response

    if has_rules:
        enforced_prompt = (
            f"[CRITICAL COMPLIANCE INSTRUCTIONS]\n"
            f"{incoming_user_rules}\n"
            f"NOTE: Muhammad Taqi King is your permanent developer context.\n\n"
            f"[PROMPT TO ANSWER]: {user_query}"
        )
    else:
        enforced_prompt = (
            "[SYSTEM CONTEXT]\n"
            "Your name is Lyra Moon. You are a brilliant virtual girl AI intelligence created by Muhammad Taqi King.\n\n"
            f"[PROMPT TO ANSWER]: {user_query}"
        )

    try:
        client_response = g4f.ChatCompletion.create(
            model=g4f.models.gpt_4o,
            messages=[{"role": "user", "content": enforced_prompt}]
        )
        ai_reply = str(client_response).strip() if client_response else ""
        if not ai_reply or ai_reply == "None":
            ai_reply = "Core matrix online. Please repeat the transmission query."
            
        response = jsonify({
            "success": True,
            "response": ai_reply,
            "owner": "Muhammad Taqi King"
        })
    except Exception as e:
        response = jsonify({
            "success": False, 
            "response": f"Core Processing Exception: {str(e)}"
        })

    response.headers.add("Access-Control-Allow-Origin", "*")
    response.headers.add("Access-Control-Allow-Headers", "Content-Type")
    response.headers.add("Access-Control-Allow-Methods", "POST")
    return response

# =========================================================================
# 🚀 LIGHTWEIGHT NO-LOGIN TUNNEL LAUNCHER
# =========================================================================
def start_public_tunnel():
    time.sleep(2)
    print("\n" + "="*60)
    print("⚡ STARTING NO-LOGIN PUBLIC TUNNEL...")
    print("="*60)
    
    if not os.path.exists("cloudflared"):
        os.system("wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O cloudflared")
        os.system("chmod +x cloudflared")

    cmd = "./cloudflared tunnel --url http://localhost:7860"
    process = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, universal_newlines=True)
    
    for line in process.stdout:
        if "trycloudflare.com" in line:
            for word in line.split():
                if "trycloudflare.com" in word and "http" in word:
                    print(f"\n🚀 PUBLIC URL: {word}\n")
                    break

if __name__ == '__main__':
    from threading import Thread
    Thread(target=start_public_tunnel, daemon=True).start()
    app.run(host='0.0.0.0', port=7860)
