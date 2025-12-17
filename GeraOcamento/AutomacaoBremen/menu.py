"""
Script interativo para facilitar o uso do sistema
"""
from DESKFLOW.app import processar_formulario
import sys


def exibir_menu():
    """Exibe o menu principal"""
    print("\n" + "=" * 60)
    print("🚀 AUTOMAÇÃO BREMEN - Menu Interativo")
    print("=" * 60)
    print("\nOpções:")
    print("1. Processar formulário (sem aprovação)")
    print("2. Processar formulário (com aprovação automática)")
    print("3. Sair")
    print("=" * 60)


def obter_numero(mensagem, obrigatorio=True):
    """Obtém um número do usuário"""
    while True:
        entrada = input(mensagem).strip()
        
        if not entrada and not obrigatorio:
            return None
        
        if entrada.isdigit():
            return int(entrada)
        
        print("❌ Por favor, digite um número válido.")


def confirmar(mensagem):
    """Pede confirmação do usuário"""
    resposta = input(f"{mensagem} (s/N): ").strip().lower()
    return resposta in ['s', 'sim', 'y', 'yes']


def processar_opcao_1():
    """Processar formulário sem aprovação"""
    print("\n📋 Processar Formulário (sem aprovação)")
    print("-" * 60)
    
    formulario_id = obter_numero("Digite o ID do formulário: ", obrigatorio=True)
    escola_id = obter_numero("Digite o ID da escola (Enter para padrão): ", obrigatorio=False)
    
    print("\n📝 Resumo:")
    print(f"   - Formulário ID: {formulario_id}")
    print(f"   - Escola ID: {escola_id if escola_id else 'Padrão'}")
    print(f"   - Aprovação automática: Não")
    
    if not confirmar("\n Confirma o processamento?"):
        print("❌ Operação cancelada.")
        return
    
    sucesso = processar_formulario(formulario_id, escola_id, auto_aprovar=False)
    
    if sucesso:
        print("\n✅ Operação concluída com sucesso!")
        input("\nPressione Enter para continuar...")
    else:
        print("\n❌ Operação falhou. Verifique os logs acima.")
        input("\nPressione Enter para continuar...")


def processar_opcao_2():
    """Processar formulário com aprovação"""
    print("\n📋 Processar Formulário (com aprovação automática)")
    print("-" * 60)
    
    formulario_id = obter_numero("Digite o ID do formulário: ", obrigatorio=True)
    escola_id = obter_numero("Digite o ID da escola (Enter para padrão): ", obrigatorio=False)
    
    print("\n📝 Resumo:")
    print(f"   - Formulário ID: {formulario_id}")
    print(f"   - Escola ID: {escola_id if escola_id else 'Padrão'}")
    print(f"   - Aprovação automática: Sim")
    
    print("\n⚠️  ATENÇÃO: A proposta será aprovada automaticamente!")
    
    if not confirmar("\n Confirma o processamento?"):
        print("❌ Operação cancelada.")
        return
    
    sucesso = processar_formulario(formulario_id, escola_id, auto_aprovar=True)
    
    if sucesso:
        print("\n✅ Operação concluída com sucesso!")
        input("\nPressione Enter para continuar...")
    else:
        print("\n❌ Operação falhou. Verifique os logs acima.")
        input("\nPressione Enter para continuar...")


def main():
    """Função principal do menu interativo"""
    while True:
        exibir_menu()
        
        opcao = input("\nEscolha uma opção (1-3): ").strip()
        
        if opcao == '1':
            processar_opcao_1()
        elif opcao == '2':
            processar_opcao_2()
        elif opcao == '3':
            print("\n👋 Encerrando sistema. Até logo!")
            break
        else:
            print("\n❌ Opção inválida. Tente novamente.")
            input("Pressione Enter para continuar...")


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n\n👋 Operação interrompida pelo usuário. Até logo!")
        sys.exit(0)
    except Exception as e:
        print(f"\n❌ Erro inesperado: {e}")
        sys.exit(1)
