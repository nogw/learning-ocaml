
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | TRUE
    | TIMES
    | THEN
    | RPAREN
    | PLUS
    | LPAREN
    | LET
    | LEQ
    | INT of (
# 14 "parser.mly"
       (int)
# 19 "parser.ml"
  )
    | IN
    | IF
    | ID of (
# 15 "parser.mly"
       (string)
# 26 "parser.ml"
  )
    | FALSE
    | EQUALS
    | EOF
    | ELSE
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState22
  | MenhirState19
  | MenhirState17
  | MenhirState15
  | MenhirState13
  | MenhirState11
  | MenhirState7
  | MenhirState5
  | MenhirState2
  | MenhirState0

# 7 "parser.mly"
  
  open Ast

# 63 "parser.ml"

let rec _menhir_run11 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | ID _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | IF ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | INT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | LET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | LPAREN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | TRUE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11

and _menhir_run15 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | ID _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | IF ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | INT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | LET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | LPAREN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | TRUE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_run17 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | ID _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | IF ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | INT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | LET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | LPAREN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | TRUE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LEQ ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | FALSE ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState13
            | ID _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
            | IF ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState13
            | INT _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
            | LET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState13
            | LPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState13
            | TRUE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState13
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13)
        | TIMES ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _v : (Ast.expr) = 
# 82 "parser.mly"
                                ( Binop (Mult, e1, e2) )
# 188 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ELSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | FALSE ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | ID _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | IF ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | INT _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | LET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | LPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | TRUE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19)
        | LEQ ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | TIMES ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | ELSE | EOF | IN | LEQ | PLUS | RPAREN | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr) = 
# 83 "parser.mly"
                               ( Binop (Add, e1, e2) )
# 244 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PLUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | ELSE | EOF | IN | LEQ | RPAREN | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr) = 
# 81 "parser.mly"
                              ( Binop (Leq, e1, e2) )
# 268 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LEQ ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | ELSE | EOF | IN | RPAREN | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))), _, (e3 : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr) = 
# 90 "parser.mly"
                                                    ( If (e1, e2, e3) )
# 294 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | FALSE ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState22
            | ID _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
            | IF ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState22
            | INT _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
            | LET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState22
            | LPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState22
            | TRUE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState22
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22)
        | LEQ ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LEQ ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | ELSE | EOF | IN | RPAREN | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), (x : (
# 15 "parser.mly"
       (string)
# 359 "parser.ml"
            ))), _, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr) = 
# 89 "parser.mly"
              ( Let (x, e1, e2) )
# 364 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LEQ ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr) = 
# 91 "parser.mly"
                           (e)
# 390 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr) = 
# 73 "parser.mly"
                  ( e )
# 413 "parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (Ast.expr)) = _v in
            Obj.magic _1
        | LEQ ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.expr) = 
# 79 "parser.mly"
         ( Bool true )
# 482 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | ID _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
    | IF ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | INT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
    | LET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | LPAREN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | TRUE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQUALS ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | FALSE ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | ID _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
            | IF ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | INT _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
            | LET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | LPAREN ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | TRUE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "parser.mly"
       (int)
# 562 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (i : (
# 14 "parser.mly"
       (int)
# 570 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 77 "parser.mly"
            ( Int i )
# 575 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | ID _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | IF ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | INT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | LET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | LPAREN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | TRUE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "parser.mly"
       (string)
# 607 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (x : (
# 15 "parser.mly"
       (string)
# 615 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 78 "parser.mly"
           ( Var x )
# 620 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _v : (Ast.expr) = 
# 80 "parser.mly"
          ( Bool false )
# 631 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and prog : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.expr) =
  fun lexer lexbuf ->
    let _menhir_env = {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = Obj.magic ();
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FALSE ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | ID _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IF ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | LET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LPAREN ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | TRUE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 269 "<standard.mly>"
  

# 681 "parser.ml"
