from flask import Flask, render_template_string

app = Flask(__name__)

# Main HTML jisme sirf title hoga (CTRL + U par sirf yeh dikhega)
MAIN_HTML = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nexura</title>
</head>
<body style="background-color: #090014; margin: 0;">

    <div id="nexura-app"></div>

    <script>
        // Backend API se UI components aur design fetch ho kar yahan inject hongay
        fetch('api/render-ui')
            .then(response => response.text())
            .then(htmlContent => {
                document.getElementById('nexura-app').innerHTML = htmlContent;
            })
            .catch(err => console.error('Error loading UI:', err));
    </script>

</body>
</html>"""

# Backend UI Component (CSS + HTML layout)
BACKEND_UI_COMPONENT = """<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', system-ui, -apple-system, sans-serif;
    }

    .ui-wrapper {
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: radial-gradient(circle at center, #1a0b2e, #090014);
        color: #ffffff;
    }

    .card {
        text-align: center;
        padding: 50px 40px;
        background: rgba(255, 255, 255, 0.05);
        backdrop-filter: blur(15px);
        -webkit-backdrop-filter: blur(15px);
        border-radius: 24px;
        border: 1px solid rgba(255, 255, 255, 0.1);
        box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5);
        max-width: 450px;
        width: 90%;
    }

    h1 {
        font-size: 3rem;
        font-weight: 700;
        margin-bottom: 10px;
        background: linear-gradient(45deg, #a855f7, #ec4899);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        text-shadow: 0 0 30px rgba(168, 85, 247, 0.4);
    }

    p {
        color: #a1a1aa;
        margin-bottom: 35px;
        font-size: 1rem;
    }

    .btn-group {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }

    .btn {
        padding: 16px 28px;
        font-size: 1.1rem;
        font-weight: 600;
        text-decoration: none;
        color: #ffffff;
        border-radius: 12px;
        transition: all 0.3s ease;
    }

    .btn-taqi {
        background: linear-gradient(135deg, #6366f1, #8b5cf6);
        box-shadow: 0 4px 20px rgba(99, 102, 241, 0.4);
    }

    .btn-nexura {
        background: linear-gradient(135deg, #ec4899, #f43f5e);
        box-shadow: 0 4px 20px rgba(236, 72, 153, 0.4);
    }

    .btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 25px rgba(255, 255, 255, 0.2);
    }
</style>

<div class="ui-wrapper">
    <div class="card">
        <h1>NEXURA</h1>
        <p>Welcome to Nexura Portal</p>
        
        <div class="btn-group">
            <a href="https://taqi.oneapp.dev" target="_blank" class="btn btn-taqi">Taqi App</a>
            <a href="https://nexura.oneapp.dev" target="_blank" class="btn btn-nexura">Nexura App</a>
        </div>
    </div>
</div>"""

@app.route('/')
def home():
    return render_template_string(MAIN_HTML)

@app.route('/api/render-ui')
def render_ui():
    return BACKEND_UI_COMPONENT

if __name__ == '__main__':
    app.run(debug=True)
