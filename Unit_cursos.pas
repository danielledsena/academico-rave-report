unit Unit_cursos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TForm_cursos = class(TForm)
    btn_novo: TBitBtn;
    btn_salvar: TBitBtn;
    btn_alterar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_fechar: TBitBtn;
    edt_cod: TEdit;
    edt_nome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ADOQuery_aux: TADOQuery;
    btn_localizar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_localizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    operacao, pk : string;
    procedure desabilita_salvar(Sender: TObject);
    procedure habilita_salvar(Sender: TObject);
    procedure bloqueia_campos;
    procedure libera_campos;
    procedure limpa_campos;
  end;

var
  Form_cursos: TForm_cursos;

implementation

uses Unit_logon, Unit_pesquisa;

{$R *.dfm}

{ TForm_cursos }

procedure TForm_cursos.bloqueia_campos;
var i : integer;
begin
  for i := 1 to form_cursos.ComponentCount -1 do
  begin
     if form_cursos.Components[i] is TEdit then
     begin
        (form_cursos.Components[i] as TEdit).Enabled := False;
        (form_cursos.Components[i] as TEdit).Color := clInfoBk;
     end;
  end;
end;

procedure TForm_cursos.desabilita_salvar(Sender: TObject);
begin

  btn_novo.Enabled := True;
  btn_salvar.Enabled := False;
  btn_alterar.Enabled := True;
  btn_cancelar.Enabled := False;
  btn_excluir.Enabled := True;

  if Sender = btn_novo then
     operacao := 'novo'
  else if Sender = btn_salvar then
     operacao := 'salvar'
  else if Sender = btn_alterar then
     operacao := 'alterar'
  else if Sender = btn_cancelar then
     operacao := 'cancelar'
  else if Sender = btn_excluir then
     operacao := 'excluir';

end;

procedure TForm_cursos.habilita_salvar(Sender: TObject);
begin

  btn_novo.Enabled := False;
  btn_salvar.Enabled := True;
  btn_alterar.Enabled := False;
  btn_cancelar.Enabled := True;
  btn_excluir.Enabled := False;

  if Sender = btn_novo then
     operacao := 'novo'
  else if Sender = btn_salvar then
     operacao := 'salvar'
  else if Sender = btn_alterar then
     operacao := 'alterar'
  else if Sender = btn_cancelar then
     operacao := 'cancelar'
  else if Sender = btn_excluir then
     operacao := 'excluir';

end;

procedure TForm_cursos.libera_campos;
var i : integer;
begin
  for i := 1 to form_cursos.ComponentCount -1 do
  begin
     if form_cursos.Components[i] is TEdit then
     begin
        (form_cursos.Components[i] as TEdit).Enabled := True;
        (form_cursos.Components[i] as TEdit).Color := clWindow;
     end;
  end;
end;

procedure TForm_cursos.limpa_campos;
var i : integer;
begin
  for i := 1 to form_cursos.ComponentCount -1 do
  begin
     if form_cursos.Components[i] is TEdit then
     begin
        (form_cursos.Components[i] as TEdit).Clear;
     end;
  end;
end;

procedure TForm_cursos.FormShow(Sender: TObject);
begin
  pk := '';
  operacao := '';
  limpa_campos;
  bloqueia_campos;
  desabilita_salvar(sender);
end;

procedure TForm_cursos.btn_novoClick(Sender: TObject);
begin
  libera_campos;
  limpa_campos;
  pk := '';
  habilita_salvar(sender);
end;

procedure TForm_cursos.btn_salvarClick(Sender: TObject);
  
var deuerro : boolean;
begin
  if (edt_cod.Text='') or (edt_nome.Text='') then
     begin
       Showmessage('Preencha todos os campos!');
     end
  else
     begin
       if operacao = 'novo' then
          adoquery_aux.SQL.Text := 'INSERT INTO CURSOS VALUES '+
                                   '('+ QuotedStr(edt_cod.Text) +
                                   ','+ QuotedStr(edt_nome.Text) + ')'
       else if operacao = 'alterar' then
          adoquery_aux.SQL.Text := ' UPDATE CURSOS SET '+
                                   ' COD_CURSO ='+ QuotedStr(edt_cod.Text) +
                                   ', NOME ='+ QuotedStr(edt_nome.Text) +
                                   ' WHERE COD_CURSO = '+ QuotedStr(pk);
       Form_logon.ConexaoBD.BeginTrans;
       try
          ADOQuery_aux.ExecSQL;
          deuerro := false;
       except
          on E : Exception do
          begin
               deuerro := true;
               if Form_logon.ErroBD(E.Message,'PK_Cursos') = 'Sim' then
                  ShowMessage('Curso j� cadastrado!')
               else if Form_logon.ErroBD(E.Message,'FK_Turmas_Cursos') = 'Sim' then
                  Showmessage('Existem turmas cadastradas para este curso!')
               else
                  ShowMessage('Ocorreu o seguinte erro: ' + E.Message);
          end;
     end;

     if deuerro = true then
        begin
          Form_logon.ConexaoBD.RollbackTrans;
        end
     else
        begin
          Form_logon.ConexaoBD.CommitTrans;
          pk := edt_cod.Text;
          desabilita_salvar(sender);
          bloqueia_campos;
        end;
     end;
end;

procedure TForm_cursos.btn_alterarClick(Sender: TObject);
begin
  if pk = '' then
     Showmessage('Imposs�vel alterar!')
  else
  begin
     libera_campos;
     habilita_salvar(sender);
  end;
end;

procedure TForm_cursos.btn_cancelarClick(Sender: TObject);
begin
  if operacao = 'novo' then
     limpa_campos;

  desabilita_salvar(sender);
  bloqueia_campos;
end;

procedure TForm_cursos.btn_excluirClick(Sender: TObject);
var deuerro : boolean;
begin
  if pk = '' then
     Showmessage('Imposs�vel excluir!')
  else
     begin
       adoquery_aux.SQL.Text := ' DELETE FROM CURSOS ' +
                                ' WHERE COD_CURSO = ' + QuotedStr(pk);
       Form_logon.ConexaoBD.BeginTrans;
       
       try
         ADOQuery_aux.ExecSQL;
         deuerro := false;
       except 
         on E : Exception do
         begin
            deuerro := true;
            if Form_logon.ErroBD(E.Message,'FK_Turmas_Cursos') = 'Sim' then
               Showmessage('Existem turmas cadastradas para este curso!')
            else
               Showmessage('Ocorreu o seguinte erro: ' + E.Message);
         end;
     end;

     if deuerro = true then
       begin
         Form_logon.ConexaoBD.RollbackTrans;
       end
     else
       begin
         Form_logon.ConexaoBD.CommitTrans;
         pk := '';
         desabilita_salvar(sender);
         limpa_campos;
         bloqueia_campos;
         end;
       end;
end;  

procedure TForm_cursos.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_cursos.btn_localizarClick(Sender: TObject);
begin
  limpa_campos;
  bloqueia_campos;
  desabilita_salvar(sender);

  Form_pesquisa.sql_pesquisa:='SELECT COD_CURSO, NOME FROM CURSOS ';
  Form_pesquisa.ShowModal;
  if Form_pesquisa.chave <> '' then
  begin
     pk := Form_pesquisa.chave;
     ADOQuery_aux.SQL.Text := ' SELECT * FROM CURSOS '+
                              ' WHERE COD_CURSO = ' + QuotedStr(pk);
     ADOQuery_aux.Open;
     edt_cod.Text := ADOQuery_aux.fieldbyname('COD_CURSO').AsString;
     edt_nome.Text := ADOQuery_aux.fieldbyname('NOME').AsString;
  end;
end;

end.
