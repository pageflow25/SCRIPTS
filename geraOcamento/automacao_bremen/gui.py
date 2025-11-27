"""
Interface Gráfica (GUI) para Automação Bremen usando Tkinter
"""
import tkinter as tk
from tkinter import ttk, messagebox, scrolledtext
import threading
import sys
from app import processar_formulario


class BremenGUI:
    def __init__(self, root):
        self.root = root
        self.root.title("Automação Bremen - Sistema de Orçamento")
        self.root.geometry("800x600")
        self.root.resizable(True, True)
        
        # Variáveis
        self.formulario_id_var = tk.StringVar()
        self.escola_id_var = tk.StringVar()
        self.auto_aprovar_var = tk.BooleanVar(value=False)
        self.processando = False
        
        # Configurar estilo
        self.configurar_estilo()
        
        # Criar interface
        self.criar_interface()
        
    def configurar_estilo(self):
        """Configura o estilo dos widgets"""
        style = ttk.Style()
        style.theme_use('clam')
        
        # Cores
        style.configure('Title.TLabel', font=('Segoe UI', 16, 'bold'), foreground='#2c3e50')
        style.configure('Subtitle.TLabel', font=('Segoe UI', 10), foreground='#7f8c8d')
        style.configure('Info.TLabel', font=('Segoe UI', 9), foreground='#34495e')
        style.configure('Success.TButton', font=('Segoe UI', 10, 'bold'), foreground='white', background='#27ae60')
        style.configure('Primary.TButton', font=('Segoe UI', 10), background='#3498db')
        
    def criar_interface(self):
        """Cria todos os elementos da interface"""
        # Frame principal
        main_frame = ttk.Frame(self.root, padding="20")
        main_frame.grid(row=0, column=0, sticky=(tk.W, tk.E, tk.N, tk.S))
        
        # Configurar grid
        self.root.columnconfigure(0, weight=1)
        self.root.rowconfigure(0, weight=1)
        main_frame.columnconfigure(0, weight=1)
        
        # Título
        titulo = ttk.Label(main_frame, text="🚀 Automação Bremen", style='Title.TLabel')
        titulo.grid(row=0, column=0, pady=(0, 5), sticky=tk.W)
        
        subtitulo = ttk.Label(main_frame, text="Sistema de Orçamento e Proposta", style='Subtitle.TLabel')
        subtitulo.grid(row=1, column=0, pady=(0, 20), sticky=tk.W)
        
        # Frame de entrada de dados
        self.criar_frame_entrada(main_frame, row=2)
        
        # Frame de opções
        self.criar_frame_opcoes(main_frame, row=3)
        
        # Frame de botões
        self.criar_frame_botoes(main_frame, row=4)
        
        # Frame de log/saída
        self.criar_frame_log(main_frame, row=5)
        
    def criar_frame_entrada(self, parent, row):
        """Cria o frame de entrada de dados"""
        frame = ttk.LabelFrame(parent, text="📋 Dados do Formulário", padding="15")
        frame.grid(row=row, column=0, sticky=(tk.W, tk.E), pady=(0, 10))
        frame.columnconfigure(1, weight=1)
        
        # ID do Formulário
        ttk.Label(frame, text="ID do Formulário:", style='Info.TLabel').grid(row=0, column=0, sticky=tk.W, pady=5)
        formulario_entry = ttk.Entry(frame, textvariable=self.formulario_id_var, font=('Segoe UI', 10), width=30)
        formulario_entry.grid(row=0, column=1, sticky=(tk.W, tk.E), padx=(10, 0), pady=5)
        
        # Tooltip
        ttk.Label(frame, text="(Obrigatório)", font=('Segoe UI', 8), foreground='#e74c3c').grid(row=0, column=2, sticky=tk.W, padx=(5, 0))
        
        # ID da Escola
        ttk.Label(frame, text="ID da Escola:", style='Info.TLabel').grid(row=1, column=0, sticky=tk.W, pady=5)
        escola_entry = ttk.Entry(frame, textvariable=self.escola_id_var, font=('Segoe UI', 10), width=30)
        escola_entry.grid(row=1, column=1, sticky=(tk.W, tk.E), padx=(10, 0), pady=5)
        
        # Tooltip
        ttk.Label(frame, text="(Opcional - deixe vazio para usar o padrão)", font=('Segoe UI', 8), foreground='#95a5a6').grid(row=1, column=2, sticky=tk.W, padx=(5, 0))
        
    def criar_frame_opcoes(self, parent, row):
        """Cria o frame de opções"""
        frame = ttk.LabelFrame(parent, text="⚙️ Opções", padding="15")
        frame.grid(row=row, column=0, sticky=(tk.W, tk.E), pady=(0, 10))
        
        # Checkbox de aprovação automática
        aprovar_check = ttk.Checkbutton(
            frame, 
            text="Aprovar proposta automaticamente após criar orçamento",
            variable=self.auto_aprovar_var,
            command=self.on_aprovar_changed
        )
        aprovar_check.grid(row=0, column=0, sticky=tk.W)
        
        # Label de aviso
        self.aviso_label = ttk.Label(
            frame, 
            text="⚠️ ATENÇÃO: A proposta será aprovada automaticamente!", 
            font=('Segoe UI', 9, 'bold'),
            foreground='#e74c3c'
        )
        self.aviso_label.grid(row=1, column=0, sticky=tk.W, pady=(5, 0))
        self.aviso_label.grid_remove()  # Ocultar inicialmente
        
    def criar_frame_botoes(self, parent, row):
        """Cria o frame de botões de ação"""
        frame = ttk.Frame(parent)
        frame.grid(row=row, column=0, sticky=(tk.W, tk.E), pady=(0, 10))
        
        # Botão Processar
        self.btn_processar = ttk.Button(
            frame,
            text="▶️ Processar Formulário",
            command=self.processar,
            style='Success.TButton',
            width=25
        )
        self.btn_processar.pack(side=tk.LEFT, padx=(0, 10))
        
        # Botão Limpar
        btn_limpar = ttk.Button(
            frame,
            text="🗑️ Limpar",
            command=self.limpar,
            width=15
        )
        btn_limpar.pack(side=tk.LEFT, padx=(0, 10))
        
        # Botão Sair
        btn_sair = ttk.Button(
            frame,
            text="❌ Sair",
            command=self.sair,
            width=15
        )
        btn_sair.pack(side=tk.RIGHT)
        
    def criar_frame_log(self, parent, row):
        """Cria o frame de log de saída"""
        frame = ttk.LabelFrame(parent, text="📊 Log de Processamento", padding="10")
        frame.grid(row=row, column=0, sticky=(tk.W, tk.E, tk.N, tk.S), pady=(0, 0))
        parent.rowconfigure(row, weight=1)
        
        # Text widget com scroll
        self.log_text = scrolledtext.ScrolledText(
            frame,
            wrap=tk.WORD,
            font=('Consolas', 9),
            bg='#f8f9fa',
            fg='#2c3e50',
            height=15
        )
        self.log_text.pack(fill=tk.BOTH, expand=True)
        
        # Tags para colorir o texto
        self.log_text.tag_config('error', foreground='#e74c3c', font=('Consolas', 9, 'bold'))
        self.log_text.tag_config('success', foreground='#27ae60', font=('Consolas', 9, 'bold'))
        self.log_text.tag_config('warning', foreground='#f39c12', font=('Consolas', 9, 'bold'))
        self.log_text.tag_config('info', foreground='#3498db', font=('Consolas', 9, 'bold'))
        
        # Mensagem inicial
        self.log("Bem-vindo ao Sistema de Automação Bremen! 🚀\n", 'info')
        self.log("Preencha os dados acima e clique em 'Processar Formulário' para começar.\n\n")
        
    def on_aprovar_changed(self):
        """Callback quando a opção de aprovação muda"""
        if self.auto_aprovar_var.get():
            self.aviso_label.grid()
        else:
            self.aviso_label.grid_remove()
            
    def log(self, mensagem, tag=None):
        """Adiciona uma mensagem ao log"""
        self.log_text.insert(tk.END, mensagem, tag)
        self.log_text.see(tk.END)
        self.log_text.update()
        
    def validar_entrada(self):
        """Valida os dados de entrada"""
        formulario_id = self.formulario_id_var.get().strip()
        
        if not formulario_id:
            messagebox.showerror("Erro de Validação", "O ID do formulário é obrigatório!")
            return False
            
        if not formulario_id.isdigit():
            messagebox.showerror("Erro de Validação", "O ID do formulário deve ser um número!")
            return False
            
        escola_id = self.escola_id_var.get().strip()
        if escola_id and not escola_id.isdigit():
            messagebox.showerror("Erro de Validação", "O ID da escola deve ser um número!")
            return False
            
        return True
        
    def processar(self):
        """Processa o formulário"""
        if self.processando:
            messagebox.showwarning("Processando", "Já existe um processamento em andamento!")
            return
            
        if not self.validar_entrada():
            return
            
        # Confirmar ação
        formulario_id = int(self.formulario_id_var.get().strip())
        escola_id_str = self.escola_id_var.get().strip()
        escola_id = int(escola_id_str) if escola_id_str else None
        auto_aprovar = self.auto_aprovar_var.get()
        
        mensagem = f"Processar formulário ID {formulario_id}"
        if escola_id:
            mensagem += f" (Escola ID: {escola_id})"
        if auto_aprovar:
            mensagem += "\n\n⚠️ A proposta será APROVADA AUTOMATICAMENTE!"
        mensagem += "\n\nConfirma?"
        
        if not messagebox.askyesno("Confirmar Processamento", mensagem):
            return
            
        # Limpar log
        self.log_text.delete(1.0, tk.END)
        
        # Iniciar processamento em thread separada
        self.processando = True
        self.btn_processar.config(state='disabled', text="⏳ Processando...")
        
        thread = threading.Thread(
            target=self.executar_processamento,
            args=(formulario_id, escola_id, auto_aprovar),
            daemon=True
        )
        thread.start()
        
    def executar_processamento(self, formulario_id, escola_id, auto_aprovar):
        """Executa o processamento em background"""
        # Redirecionar stdout para o log
        original_stdout = sys.stdout
        
        class LogRedirector:
            def __init__(self, log_func):
                self.log_func = log_func
                
            def write(self, message):
                if message.strip():
                    # Detectar tipo de mensagem e aplicar cor
                    if '❌' in message or 'Erro' in message or 'erro' in message:
                        tag = 'error'
                    elif '✅' in message or 'sucesso' in message.lower():
                        tag = 'success'
                    elif '⚠️' in message or 'ATENÇÃO' in message:
                        tag = 'warning'
                    elif '🚀' in message or '📋' in message:
                        tag = 'info'
                    else:
                        tag = None
                    self.log_func(message, tag)
                    
            def flush(self):
                pass
        
        sys.stdout = LogRedirector(self.log)
        
        try:
            # Executar processamento
            sucesso = processar_formulario(formulario_id, escola_id, auto_aprovar)
            
            # Mostrar resultado final
            if sucesso:
                self.root.after(0, lambda: messagebox.showinfo(
                    "Sucesso! ✅",
                    "Processamento concluído com sucesso!"
                ))
            else:
                self.root.after(0, lambda: messagebox.showerror(
                    "Erro ❌",
                    "Ocorreram erros durante o processamento.\nVerifique o log para mais detalhes."
                ))
                
        except Exception as e:
            self.log(f"\n❌ Erro inesperado: {e}\n", 'error')
            self.root.after(0, lambda: messagebox.showerror(
                "Erro Crítico",
                f"Erro inesperado durante o processamento:\n\n{str(e)}"
            ))
        finally:
            # Restaurar stdout
            sys.stdout = original_stdout
            
            # Reabilitar botão
            self.processando = False
            self.root.after(0, lambda: self.btn_processar.config(state='normal', text="▶️ Processar Formulário"))
            
    def limpar(self):
        """Limpa os campos do formulário"""
        self.formulario_id_var.set("")
        self.escola_id_var.set("")
        self.auto_aprovar_var.set(False)
        self.on_aprovar_changed()
        self.log_text.delete(1.0, tk.END)
        self.log("Campos limpos. Pronto para novo processamento.\n\n", 'info')
        
    def sair(self):
        """Fecha a aplicação"""
        if self.processando:
            if not messagebox.askyesno("Confirmar Saída", "Um processamento está em andamento.\nDeseja realmente sair?"):
                return
                
        self.root.quit()


def main():
    """Função principal"""
    root = tk.Tk()
    app = BremenGUI(root)
    
    # Centralizar janela
    root.update_idletasks()
    width = root.winfo_width()
    height = root.winfo_height()
    x = (root.winfo_screenwidth() // 2) - (width // 2)
    y = (root.winfo_screenheight() // 2) - (height // 2)
    root.geometry(f'{width}x{height}+{x}+{y}')
    
    root.mainloop()


if __name__ == "__main__":
    main()
