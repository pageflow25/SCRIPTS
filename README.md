# Scripts de Automação - Sistema de Formulários

Este repositório contém scripts SQL para automação e manutenção do sistema de formulários e pedidos.

## 📁 Scripts Disponíveis

### 🗑️ `delet_pedido_status.sql`
**Descrição:** Remove pedidos de teste do sistema
- **Função:** Exclui todos os formulários que possuem status_formulario_id = 4 (status de teste)
- **Uso:** Limpeza de dados de teste no ambiente de produção
- **Cuidado:** ⚠️ Este script remove dados permanentemente

### 👥 `permissao_full_users.sql`
**Descrição:** Concede permissões completas de visualização para usuários específicos
- **Função:** Insere permissões de visualização para todos os campos de todas as turmas de uma unidade escolar
- **Usuários contemplados:** IDs 1, 2, 3, 5, 12, 16, 18
- **Unidade escolar:** ID 28
- **Uso:** Configuração inicial de permissões para administradores

### 📊 `relatorio_pedido.sql`
**Descrição:** Gera relatório detalhado de pedidos
- **Função:** Extrai informações completas sobre formulários, arquivos PDF, especificações e distribuição
- **Campos retornados:**
  - Dados do responsável (nome, email)
  - Informações do formulário (tipo, título, data)
  - Detalhes dos arquivos PDF (nome, tipo, tamanho, páginas)
  - Especificações técnicas (formato, gramatura, cores, impressão)
  - Distribuição por unidade escolar
- **Uso:** Análise e acompanhamento de pedidos específicos

### 📈 `relatorio_pedido_json.sql`
**Descrição:** Gera relatório de pedidos em formato JSON estruturado
- **Função:** Similar ao relatório anterior, mas com saída em formato JSON para integração com APIs
- **Estrutura JSON inclui:**
  - Dados base do formulário
  - Especificações técnicas organizadas
  - Distribuição por unidade em array
  - Quantidade total calculada
- **Uso:** Integração com sistemas externos e dashboards

### 🔄 `reset_id_banco.sql`
**Descrição:** Redefine sequências de IDs automáticos no banco
- **Função:** Ajusta todas as sequências de ID para o próximo valor disponível
- **Processo:**
  - Identifica todas as colunas 'id' no schema público
  - Calcula o próximo ID baseado no maior valor existente
  - Atualiza a sequência correspondente
- **Uso:** Correção de problemas de sequência após importação de dados ou restauração de backup

### 📦 `Bremen/Listar_prod.sql`
**Descrição:** Consultas para análise de produtos e componentes do sistema Bremen/Wingraph
- **Função:** Conjunto de queries para exploração e análise do catálogo de produtos
- **Tabelas consultadas:**
  - `modmodeloproduto` - Modelos de produtos cadastrados
  - `modcomponente` - Componentes dos modelos
  - `modcomponentegraf` - Componentes gráficos
  - `estitemestoquesubstrato` - Itens de estoque de substratos
  - `estitemsubstratoimpressao` - Substratos para impressão
  - `caracteristicaproduto` - Características dos produtos
  - Outras tabelas relacionadas (tarefas auxiliares, grupos)
- **Consultas incluídas:**
  1. Listagem de estrutura de tabelas (colunas e tipos)
  2. Consulta de características de produtos
  3. Consulta detalhada de componentes
  4. Consulta de modelos de produtos com todas as propriedades
  5. JOIN completo entre componentes e modelos
  6. Consulta de substratos de impressão com especificações técnicas
- **Uso:** Análise de produtos, levantamento de estruturas, auditoria de catálogo

---

## 🔧 Como Usar

1. **Backup:** Sempre faça backup antes de executar scripts que modificam dados
2. **Ambiente:** Teste primeiro em ambiente de desenvolvimento
3. **Permissões:** Certifique-se de ter as permissões necessárias no banco
4. **Validação:** Verifique os resultados após a execução

## ⚠️ Avisos Importantes

- Scripts de exclusão (`delet_pedido_status.sql`) são irreversíveis
- Scripts de permissão afetam a segurança do sistema
- Sempre valide os IDs antes de executar relatórios
- Scripts de reset podem afetar a integridade referencial

---

## 📝 Adicionando Novos Scripts

### [Nome do Script]
**Descrição:** [Breve descrição do que o script faz]
- **Função:** [Função detalhada]
- **Parâmetros:** [Parâmetros necessários, se houver]
- **Uso:** [Quando e como usar]
- **Observações:** [Cuidados especiais, se necessário]

---

## 📞 Suporte

Para dúvidas ou problemas com os scripts, entre em contato com a equipe de desenvolvimento.

**Última atualização:** 2 de outubro de 2025