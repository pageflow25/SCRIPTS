import os
import base64
from email.message import EmailMessage
from google.oauth2.credentials import Credentials
from googleapiclient.discovery import build
from dotenv import load_dotenv

# Carregar variáveis de ambiente
load_dotenv()

# ==============================
# CONFIGURAÇÃO GMAIL API
# ==============================
GMAIL_CLIENT_ID = os.getenv("GMAIL_CLIENT_ID")
GMAIL_CLIENT_SECRET = os.getenv("GMAIL_CLIENT_SECRET")
GMAIL_REFRESH_TOKEN = os.getenv("GMAIL_REFRESH_TOKEN")
GMAIL_USER = os.getenv("GMAIL_USER")
EMAIL_ENABLED = os.getenv("EMAIL_ENABLED", "true").lower() == "true"

# ==============================
# CONFIGURAÇÃO DO E-MAIL
# ==============================
ASSUNTO = "ATENÇÃO: Manutenção Programada no Sistema PageFlow"
ARQUIVO_ANEXO = "arquivo.pdf"  # caminho do anexo

HTML_BODY = """
<!doctype html>
<html lang="pt-BR">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Sistema Restabelecido - PageFlow v1.0.0</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
    
    body {
      margin: 0;
      padding: 0;
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
      background: #f5f7fa;
    }
    
    /* Estilos responsivos */
    @media only screen and (max-width: 600px) {
      .container {
        width: 100% !important;
        max-width: 100% !important;
      }
      .mobile-padding {
        padding: 24px 20px !important;
      }
      .mobile-title {
        font-size: 26px !important;
      }
      .mobile-text {
        font-size: 14px !important;
      }
      .feature-card {
        margin-bottom: 16px !important;
      }
      .cta-button {
        padding: 14px 28px !important;
        font-size: 15px !important;
      }
    }
  </style>
</head>
<body style="margin:0;padding:0;background:#f5f7fa;padding:30px 15px;">
  <table role="presentation" cellpadding="0" cellspacing="0" width="100%" style="max-width:640px;margin:0 auto;border-collapse:collapse;" class="container">
    
    <!-- Container Principal -->
    <tr>
      <td style="background:#ffffff;border-radius:16px;box-shadow:0 4px 24px rgba(0,0,0,0.08);overflow:hidden;">
        
        <!-- Header com Badge de Sucesso -->
        <table role="presentation" cellpadding="0" cellspacing="0" width="100%">
          <tr>
            <td style="padding:48px 40px 36px;background:linear-gradient(135deg, #0891b2 0%, #0e7490 100%);text-align:center;" class="mobile-padding">
              
              <!-- Badge de Status -->
              <div style="display:inline-block;background:rgba(255,255,255,0.25);backdrop-filter:blur(10px);border-radius:24px;padding:8px 20px;margin-bottom:20px;">
                <span style="font-size:13px;color:#ffffff;font-weight:600;letter-spacing:0.5px;">✓ SISTEMA ONLINE</span>
              </div>
              
              <h1 style="margin:0 0 12px;font-size:32px;font-weight:700;color:#ffffff;letter-spacing:-0.8px;line-height:1.2;" class="mobile-title">
                Bem-vindo ao PageFlow
              </h1>
              <div style="display:inline-block;background:rgba(255,255,255,0.2);border-radius:20px;padding:6px 18px;margin-top:8px;">
                <p style="margin:0;font-size:15px;color:#ffffff;font-weight:600;">Versão 1.0.0</p>
              </div>
            </td>
          </tr>
        </table>

        <!-- Conteúdo -->
        <table role="presentation" cellpadding="0" cellspacing="0" width="100%">
          <tr>
            <td style="padding:44px 40px;" class="mobile-padding">
              
              <!-- Saudação -->
              <p style="margin:0 0 28px;font-size:16px;color:#1a202c;line-height:1.6;" class="mobile-text">
                Olá,
              </p>

              <!-- Mensagem Principal -->
              <p style="margin:0 0 16px;font-size:16px;color:#2d3748;line-height:1.7;" class="mobile-text">
                Temos o prazer de informar que o <strong style="color:#0891b2;">PageFlow</strong> está de volta e 
                funcionando perfeitamente!
              </p>
              
              <p style="margin:0 0 32px;font-size:16px;color:#2d3748;line-height:1.7;" class="mobile-text">
                A manutenção foi concluída com sucesso e aproveitamos para lançar oficialmente a 
                <strong>versão 1.0.0</strong>, marcando a saída da fase beta com novidades incríveis que vão 
                transformar sua experiência.
              </p>

              <!-- Título Novidades -->
              <div style="text-align:center;margin:40px 0 32px;">
                <h2 style="margin:0 0 8px;font-size:24px;font-weight:700;color:#1a202c;letter-spacing:-0.5px;">
                  O que há de novo
                </h2>
                <div style="width:60px;height:3px;background:linear-gradient(90deg, #0891b2 0%, #0e7490 100%);margin:0 auto;border-radius:3px;"></div>
              </div>

              <!-- Features Cards -->
              <div style="margin-bottom:36px;">
                
                <!-- Feature 1 -->
                <div class="feature-card" style="background:linear-gradient(135deg, #f0fdff 0%, #e0f7fa 100%);border-left:4px solid #0891b2;border-radius:12px;padding:24px;margin-bottom:20px;">
                  <table role="presentation" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                      <td style="width:48px;vertical-align:top;padding-right:16px;">
                        <div style="width:48px;height:48px;background:#0891b2;border-radius:12px;display:flex;align-items:center;justify-content:center;">
                          <span style="font-size:24px;">📦</span>
                        </div>
                      </td>
                      <td style="vertical-align:top;">
                        <h3 style="margin:0 0 8px;font-size:17px;font-weight:700;color:#0e7490;">
                          Categorias e Subcategorias
                        </h3>
                        <p style="margin:0;font-size:14px;color:#4a5568;line-height:1.6;">
                          Encontre o que precisa mais rápido! Organizamos os produtos em categorias intuitivas 
                          para direcionar você ao produto desejado em poucos cliques.
                        </p>
                      </td>
                    </tr>
                  </table>
                </div>

                <!-- Feature 2 -->
                <div class="feature-card" style="background:linear-gradient(135deg, #f0fdff 0%, #e0f7fa 100%);border-left:4px solid #0891b2;border-radius:12px;padding:24px;margin-bottom:20px;">
                  <table role="presentation" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                      <td style="width:48px;vertical-align:top;padding-right:16px;">
                        <div style="width:48px;height:48px;background:#0891b2;border-radius:12px;display:flex;align-items:center;justify-content:center;">
                          <span style="font-size:24px;">📊</span>
                        </div>
                      </td>
                      <td style="vertical-align:top;">
                        <h3 style="margin:0 0 8px;font-size:17px;font-weight:700;color:#0e7490;">
                          Área de Relatórios
                        </h3>
                        <p style="margin:0;font-size:14px;color:#4a5568;line-height:1.6;">
                          Visualize gráficos e métricas detalhadas dos seus pedidos. Acompanhe seu histórico 
                          e tome decisões mais informadas com dados em tempo real.
                        </p>
                      </td>
                    </tr>
                  </table>
                </div>

                <!-- Feature 3 -->
                <div class="feature-card" style="background:linear-gradient(135deg, #f0fdff 0%, #e0f7fa 100%);border-left:4px solid #0891b2;border-radius:12px;padding:24px;">
                  <table role="presentation" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                      <td style="width:48px;vertical-align:top;padding-right:16px;">
                        <div style="width:48px;height:48px;background:#0891b2;border-radius:12px;display:flex;align-items:center;justify-content:center;">
                          <span style="font-size:24px;">🎓</span>
                        </div>
                      </td>
                      <td style="vertical-align:top;">
                        <h3 style="margin:0 0 8px;font-size:17px;font-weight:700;color:#0e7490;">
                          Central de Tutoriais
                        </h3>
                        <p style="margin:0;font-size:14px;color:#4a5568;line-height:1.6;">
                          Dúvidas sobre o processo de pedido? Acesse nossa área de tutoriais e tenha 
                          todas as respostas a um clique de distância.
                        </p>
                      </td>
                    </tr>
                  </table>
                </div>

              </div>

              <!-- Vídeo Tutorial -->
              <div style="background:#f7fafc;border-radius:12px;padding:24px;text-align:center;margin-bottom:32px;">
                <h3 style="margin:0 0 12px;font-size:20px;font-weight:700;color:#1a202c;">
                  Tutorial Completo
                </h3>
                <p style="margin:0 0 20px;font-size:15px;color:#4a5568;line-height:1.6;">
                  Aprenda o passo a passo completo de como realizar pedidos no novo fluxo
                </p>
                
                <!-- Player de Vídeo -->
                <div style="max-width:560px;margin:0 auto;border-radius:12px;overflow:hidden;box-shadow:0 4px 20px rgba(0,0,0,0.15);">
                  <video 
                    controls 
                    style="width:100%;height:auto;display:block;border-radius:12px;"
                    poster="https://ik.imagekit.io/pageflow/videos-avisos/Tutorial.mp4?tr=f-jpg,w-560"
                  >
                    <source src="https://ik.imagekit.io/pageflow/videos-avisos/Tutorial.mp4" type="video/mp4">
                    Seu cliente de email não suporta vídeos. 
                    <a href="https://ik.imagekit.io/pageflow/videos-avisos/Tutorial.mp4" style="color:#0891b2;text-decoration:underline;">Clique aqui para assistir</a>
                  </video>
                </div>
              </div>

              <!-- Nota Final -->
              <div style="background:#f7fafc;border-radius:8px;padding:20px;margin-bottom:8px;">
                <p style="margin:0;font-size:14px;color:#4a5568;line-height:1.7;text-align:center;">
                  Agradecemos pela paciência durante a manutenção. Estamos animados para que você 
                  explore todas as novidades e aproveite a melhor versão do PageFlow!
                </p>
              </div>

            </td>
          </tr>
        </table>

        <!-- Rodapé -->
        <table role="presentation" cellpadding="0" cellspacing="0" width="100%">
          <tr>
            <td style="padding:32px 40px;background:#fafbfc;border-top:1px solid #e2e8f0;" class="mobile-padding">
              <p style="margin:0 0 6px;font-size:14px;color:#4a5568;line-height:1.5;">
                Atenciosamente,
              </p>
              <p style="margin:0 0 20px;font-size:16px;color:#1a202c;font-weight:700;">
                Equipe PageFlow
              </p>
              <div style="font-size:14px;color:#718096;line-height:1.6;">
                <p style="margin:0 0 4px;">pageflow.casadagrafica@gmail.com</p>
              </div>
            </td>
          </tr>
        </table>

        <!-- Bottom Bar -->
        <table role="presentation" cellpadding="0" cellspacing="0" width="100%">
          <tr>
            <td style="padding:20px 40px;background:linear-gradient(135deg, #0891b2 0%, #0e7490 100%);" class="mobile-padding">
              <p style="margin:0;font-size:13px;color:rgba(255,255,255,0.9);text-align:center;line-height:1.5;">
                PageFlow v1.0.0 © 2025 - Todos os direitos reservados.
              </p>
            </td>
          </tr>
        </table>

      </td>
    </tr>
    
  </table>
</body>
</html>
"""

# ==============================
# LISTA ORIGINAL DE E-MAILS
# ==============================
emails_raw = """
zacanini2@gmail.com
"""

# ==============================
# LIMPEZA E DEDUPLICAÇÃO
# ==============================
emails = list({
    email.strip().lower()
    for email in emails_raw.replace('"', '').replace('\n', ',').split(',')
    if email.strip()
})

print(f"📧 Total de e-mails únicos: {len(emails)}")

# ==============================
# FUNÇÃO PARA CRIAR SERVIÇO GMAIL
# ==============================
def criar_servico_gmail():
    """Cria e retorna o serviço da Gmail API usando OAuth2"""
    creds = Credentials(
        token=None,
        refresh_token=GMAIL_REFRESH_TOKEN,
        token_uri="https://oauth2.googleapis.com/token",
        client_id=GMAIL_CLIENT_ID,
        client_secret=GMAIL_CLIENT_SECRET,
        scopes=["https://www.googleapis.com/auth/gmail.send"]
    )
    
    service = build('gmail', 'v1', credentials=creds)
    return service

# ==============================
# FUNÇÃO DE ENVIO
# ==============================
def enviar_email(destinatario):
    """Envia e-mail usando a Gmail API"""
    if not EMAIL_ENABLED:
        print(f"⏭️ Envio desabilitado - {destinatario}")
        return
    
    # Criar mensagem
    msg = EmailMessage()
    msg["From"] = GMAIL_USER
    msg["To"] = destinatario
    msg["Subject"] = ASSUNTO
    msg.set_content("Seu cliente de e-mail não suporta HTML.")
    msg.add_alternative(HTML_BODY, subtype="html")

    # Adicionar anexo se existir
    if os.path.exists(ARQUIVO_ANEXO):
        with open(ARQUIVO_ANEXO, "rb") as f:
            msg.add_attachment(
                f.read(),
                maintype="application",
                subtype="pdf",
                filename=os.path.basename(ARQUIVO_ANEXO)
            )
    
    # Codificar mensagem em base64
    raw_message = base64.urlsafe_b64encode(msg.as_bytes()).decode('utf-8')
    
    # Enviar via Gmail API
    service = criar_servico_gmail()
    message = service.users().messages().send(
        userId='me',
        body={'raw': raw_message}
    ).execute()
    
    return message

# ==============================
# DISPARO INDIVIDUAL
# ==============================
for email in emails:
    try:
        enviar_email(email)
        print(f"✅ Enviado para {email}")
    except Exception as e:
        print(f"❌ Erro ao enviar para {email}: {e}")
