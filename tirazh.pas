(*=p-,t-,l-,m-*)_program ТИРАЖ;
_label 4521;
_const bibVol=2048; bibName='СПЕЦ  '; bibZone=1300B; fikt = '!ФИКТ!';
magic=33555c; tskmsk='0+++++'; zz = '000000';
sp=' '; dot='.';etx='{377';minus='-';eq='=';colon=':';empty='{146';comma=',';
spaces='      ';oq='{022'; cq='{023'; plus='+';
c4096=4096; m24e1=100000000C;
_type
letter = 'A'..'Z';
digit='0'..'9';
mask=_set _of 0..47;
charset=_set _of '0'..'П';
unp = _array [1..6] _of char;
word = _record _case integer _of
0:(s:mask);
1:(i:integer);
6:(a:alfa)
_end;
page = _array [0..1023] _of word;
fifty=_array[1..50] _of alfa;
mask10 = _array [0..9] _of mask;
_var
gl10z, valid, gl12z:boolean;
cmd, gl14z, taskid:alfa;
pptr, prog: @page;
gl18z, curVol, paspVol, myZone, IPZ, paper:integer;
pagemap: mask10;
gl33z:_array[1..10] _of integer;
gl41z:mask;
foo1:_array [0..32] _of char; foo2: unp; (* unused *)
fileLoc:_array[1..50] _of integer;
files1, files2:fifty;
_procedure skipsp;
_(
  _while input@ = sp _do get(input);
_);

_procedure release;
_var l2v1z:integer;
_(
  l2v1z := 2050770000000000C;
  code(2Э0723=,);
  curVol := 0;
_);

_procedure status;
_label 1;
_var l2v1z: alfa; buf:_array[1..9] _of integer;l2v11z:@integer;
l2v12z:integer; l2v13z:mask;
_(
  writeln;
  code(СЧ77015=2ЗЧ3,);
  _if l2v1z = 'Н{3770000' _then _(
    _if gl12z _then _(
      gl12z := false;
      l2v11z := ref(buf);
      code(УИ15=);
      taskid := taskid;
      code(Э06240=,);
      l2v13z := ;
      _if (l2v13z = []) _then _goto 1 _else _if 0 _IN l2v13z _then _(
        code(Э0620=,); (q) _exit q;
      _);
      l2v12z := sel(l2v13z,0,9);
      code(уи15=);
      l2v12z := 77700000C;
      code(э062100=,);
      1: writeln('ЗАКАЗ БОБИНЫ ОТМЕНЕН');
      release; 
    _);
    _GOTO 4521;
  _);
_);

_procedure writeOct(val, width: integer);
_var a : alfa; arr: unp;
_(
  mapia(val, a);
  unpck(arr[1], a);
  _for val := 7 - width _to 6 _do _(
    output@ := arr[val];
    put(output);
  _);
_);
_procedure P0703(l2a1z:integer);
_var l2v1z:integer;
_(
  l2v1z := l2a1z _div 10;
  write(l2v1z:1);
  write(l2a1z-l2v1z*10:1);
_);

_procedure readZone(HY, ZZZZ: integer);
_(
  code(7ПАэ70ис=2сч3,сд/-14/=7ЦС,2ЦС4=2ЗЧ4,2Э0704=,7ПБ2=,С;э70ис:0010320000000000,0010370000500000,к;);
_);

_procedure writeZone(l2a1z, l2a2z: integer);
_(
  code(7ПАэ70ис2=2сч3,сд/-14/=7ЦС,2ЛС4=2ЗЧ4,2Э0704=,7ПБ1=,С;э70ис2:0000320000000000,к;);
_);

_function getNum(base:integer):integer;
_var l2v1z: integer;
_(
  l2v1z := 0;
  skipsp;
  _while input@ _in digit _do _(
    l2v1z := l2v1z * base + ord(input@);
    get(input);
  _);
  skipsp;
  getNum := l2v1z;
_);

_procedure getAlfa(_var l2a1z:alfa);
_var l2v1z: unp; l2v7z: integer;
_(
  _for l2v7z _to 6 _do _(
    _if (input@ = etx) _or 
        (input@ = '(') _or
        (input@ = sp) _or
        (input@ = eq) _then 
      l2v1z[l2v7z] := sp
    _else _(
      l2v1z[l2v7z] := input@;
      get(input);
    _)
  _);
  pck(l2v1z[1], l2a1z);
  skipsp;
_);

_function ITOA(i:integer):alfa;
_var k, n, m: integer; arr: unp; a:alfa;
_(
  m := 100000;
  _for k _to 6 _do _(
    n := i _div m;
    arr[k] := ;
    i := i - n*m;
    m := m _div 10;
  _);
  pck(arr[1], a);
  ITOA := a;
_);

_function reqVol(vol:integer):boolean;
_var l2v1z, l2v2z, l2v3z, l2v4z:integer; avol:alfa;
_(
  reqVol := true;
  _if (vol <= 0) _then exit;
  avol := ITOA(vol);
  l2v2z := 5077C;
  code(СД/-44/=);
  l2v2z := ;
  l2v3z := 1703607417C;
  l2v4z := 177777C;
  code(2сч11=2сб7,2рб10=2зч11,2лс6=э050131,);
  l2v2z := ;
  _if (l2v2z = 0) _then exit;
  reqVol := false;
_);

_procedure task(vol:integer);
_const len=17;
_var i, j, k:integer;
  w: alfa;
  u1, u2, u3: unp;
  arr: _array [0..len] _of char;
  form:_record a:_array[0..26] _of alfa _end;
_(
  code(7пакод=э050100,7зч5=7пб7,с;0,0,0,0,0,0,0,0,0,0,0,к;код:7пакод=15па50050,7сч5=э05337,сч20=зч17,7сч5=э05333,ви0=э05315,c;0,741700007417,к;ви7=э05311,7па2000=ви7,7пакод=э05312,э05314=,);
  form := [ 'ТКН000',
   (* 1 *) 'ШИФР  ',
   (* 2     ОГЧЕЗК *),
   (* 3     ЗАДАВА *),
   (* 4 *) '^ЛИСТ ',
   (* 5 *) '0^ВХОД',
   (* 6 *) ' 11^ВР',
   (* 7 *) 'ЕМ 10^',
   (* 8 *) 'ИНКО^А',
   (* 9 *) 'ЦПУ 1^',
   (*10 *) 'ЛЕНТ  ',
   (*11 *) '50(000',
   (*12     НОМБОБ *),
   (*13 *) '-ЗП)  ',
   (*14     ^МАШ 0 *),
   (*15 *) '^Е^В10',
   (*16-18 *), , ,
   (*19 *) '000100',
   '010K00',
   '053004',
   '6К0007',
   '40000В',
   '000100',
   'ЕКОНЕЦ',
   '{341{341{341{341{341{341'
  ];
  code(7СЧ5=7РБ6,); form.a[2] :=;
  code(7СЧ5=СД/-30/,7РБ6=); w :=;
  unpck(u1[1], w);
  w := '654321';
  unpck(u2[1], w );
  w := tskmsk;
  unpck(u3[1], w );
  _for j _to 6 _do _(
    _if u3[j] = plus _then 
      u1[j] := u2[j]
  _);
  pck(u1[1], form.a[3]);
  w := form.a[2];
  code(7СБ6=17ЗЧ,);
  w := form.a[3];
  code(7СБ6=СД/30/,17ЛС=); taskid :=;
  _for j _to 16 _do _(
    code(7СЧ5=СД/-3/,7ЗЧ5=МР,);
    arr[j] := ;
  _);
  arr[0] := 'C';
  arr[17] := 'K';
  j := 0;
  (*=m+*)
  _while j <= 2 _do _(
    pck(arr[j*6], form.a[16+j]);
    j := j + 1;
   _);(*=m-*)
  form.a[12] := ITOA(vol);
  taskid := taskid;
  code(7ЗЧ5=);
  i := 7;
  code(Э050114=,2ЛУ4=);
  i := ;
  w := '^МАШ 0';
  code(2ЛС4=);
  form.a[14] := ;
  gl12z := true;
  i := ord(ref(form));
  code(Э0507701=,);
  j := ;
  _if (i <> j) _then writeln(' НЕ ');
_);

_function getCmd(_var l2a1z: alfa): boolean;
_const four = 4;
_var l2v1z: unp; i: integer;
_(
  skipsp;
  _if input@ = eq _then
    _for i _to 4 _do
      get(input);
  i := 1;
  l2a1z := spaces;
  unpck(l2v1z[1], l2a1z);
  _while (input@ _in letter) _and (i < 4) _do _(
    l2v1z[i] := input@;
    get(input);
    i := i + 1;
  _);
  _while (input@ _in letter) _or (input@ = '-') _do
    get(input);
  skipsp;
  pck(l2v1z[1], l2a1z);
  getCmd := i > 1;
_);

_function inMap(l2a1z:integer; _var l2a2z: mask10): boolean;
_var l2v1z: integer;
_(
  l2v1z := l2a1z _DIV 48;
  inMap := (l2a1z - l2v1z * 48) _in l2a2z[l2v1z];
_);

_function readMap(_var l2a1z: mask10): boolean;
_label 1423, 1431;
_var l2v1z, l2v2z, l2v3z, l2v4z:integer; l2v5z:mask10;
_procedure P1352;
_var l3v1z: integer;
_(
  l2v1z := getNum(10);
  _if (input@ = '-') _then _(
    get(input);
    l2v2z := getNum(10);
  _) _else _(
    l2v2z := l2v1z;
  _);
  _for l3v1z := l2v1z _to l2v2z _do _(
    l2v4z := l3v1z _DIV 48;
    _if (l2v4z > 9) _then _(
      readMap := true;
      _GOTO 1431;
    _);
    l2v5z[l2v4z] := l2v5z[l2v4z] + [l3v1z-l2v4z*48];
  _);
_);

_( (* readMap *)
  _for l2v3z := 0 _to 9 _do _(
    l2v5z[l2v3z] := [];
  _);
  readMap := false;
  _if (input@ = '(') _then _(
    get(input);
  1423:
    P1352;
    _if (input@ = comma) _then _(
      get(input);
      _goto 1423;
    _);
    _if (input@ = ')') _then 
      get(input);
  _);
  1431: 
  skipsp;
  l2a1z := l2v5z;
_);

_procedure P2707;
_const c57=57;c58=58;c122=122;eol='{175';c97=97;c98=98;c99=99;c100=100;c101=101;
thous=1000;ss='Ь';c40=40;repl='{174';thous7=7000;
_var ch:char; l2v1a:_array [1..1000] _of char;
  l2k2z, interl, l2k4z, pos: integer;
right, cur, l2k8z, pgright, pgleft:integer; adj, mono, hyphen, l2k14z,
center, l2k16z, cont:boolean; conti:integer; vowels: mask;
  l2k20z:charset;
ЙЬ:mask; start, l2k23z, pnum:integer; doLnum, l2k26z:boolean;  lineno, lpp:integer;
  canvas:_array [1..7000] _of char; 
_procedure P2535;
_var rem: integer;
_procedure doLine;
_label 2472;
_var i: integer;
_procedure P1441;
_var j: integer;
_( (* P1441 *)
  _case l2k2z _of
  0: _(
    canvas[pos] := l2v1a[1];
    pos := pos + 1;
  _);
  1: _(
    _if l2k4z = 2 _then _(
      canvas[pos] := l2v1a[1];
      canvas[pos + 1] := ;
      pos := pos + 2;
    _) _else _(
      canvas[pos] := l2v1a[1];
      canvas[pos + 1] := repl;
      canvas[pos + 2] := chr(l2k4z - 1);
      pos := pos + 3;
    _);
  _); 
  2: 
    _for j _to l2k4z _do _(
      canvas[pos] := l2v1a[j];
      pos := pos + 1;
    _)
  _end;
_);
_procedure addSp(n:integer);
_var i: integer;
_(
  rem := rem - n;
  _for i _to n _do _(
    canvas[pos] := sp;
    pos := pos + 1;
  _)
_);
_procedure P1552;
_label 1577, 1664, 2073;
_type spec = '{141' .. '{146';
_var t: integer;
_procedure getDec(_var l6a1z:integer);
_var l6v1z:integer;
_(
  l6v1z := 0;
  _while input@ _in digit _do _(
    l6v1z := l6v1z * 10 + ord(input@);
    get(input);
  _);
  l6a1z := l6v1z;
_);
_procedure isPlus(_var r: boolean);
_(
  get(input);
  r := input@ = plus;
_);
_( (* P1552 *) (start) _(
  
  ch := input@; 
  get(input);
  (rep) _if (ch = '{172') _then _(
    cont := false;
    conti := 0;
    _GOTO 2472;
  _) _else _if (ch = eol) _or (ch = '{341') _then _(
    l2k26z := false;
    _GOTO 2472;
  _) _else _(
    _if ch = input@ _then _(
      _if ch = ss _then _(
        get(input);
  1577:
        _if (input@ _IN l2k20z) _then
          _case input@ _of
          'Л': (*1602*) ch := '{141';
          'Н': (*1604*) ch := eol;
          'З': (*1606*) ch := '{144';
          'К': (*1610*) ch := '{142';
          'И': (*1612*) ch := '{143';
          'Е': (*1614*) ch := '{172';
          'M': (*1616*) ch := '{146';
          '-': (*1620*) _( _repeat
            _while (input@ <> ss) _do  get(input);
            get(input);
            ch := input@;
            get(input);
            _until (ch = ss) _and (input@ = plus);
            get(input);
            _goto start;
          _)
          _end;
          (* 1650 *)
          get(input);
          _goto rep;
        _) _else  (* 1652 *) _if _not (ch _in letter) _then _(
          l2k4z := 1;
          _repeat
            l2k4z := l2k4z + 1;
            get(input);
          _until (input@ <> ch);
          l2v1a[1] := ch;
          l2k2z := 1;
        _) _else 1664: _(
          l2k4z := 1;
          l2v1a[1] := ch;
          l2k2z := 2;
          (LOOP) _while (input@ _in letter) _or
            (mono _and (input@ <> sp) _and (input@ < '{141')) _do _(
            _if input@ = ss _then _(
              get(input);
              _if input@ = ss _then _( input@ := '{145'; exit _);
              l2k4z := l2k4z + 1;
              l2v1a[l2k4z] := ss;
              _goto LOOP;
            _); (*1707*)
            l2k4z := l2k4z + 1;
            l2v1a[l2k4z] := input@;
            get(input);
          _); (q) _exit q;
        _); _goto 2073;
      _); (* 1716 *)
      _if ch _in spec _then _case ord(ch)-ord('{141') _of
      0: _(
        cont := false;
        _GOTO 2472;
      _);
      1: _(
        l2k23z := ord(input@);
        get(input);
        _if l2k23z > 40 _then l2k23z := 40;
        t := l2k23z - (57 - rem);
        _if t >= 1 _then addSp(t);
        _goto start;
      _);
      2: _(
        ch := input@;
        hyphen := ;
        get(input);
        _goto start;
      _);
      3: _(
        center := true;
        _GOTO 2472;
      _);
      4: _goto 1577;
      5: _(
        _if (input@ = 'N') _then doLnum := true
        _else _if (input@ = 'M') _then isPlus(mono)
        _else _if (input@ = 'B') _then isPlus(adj)
        _else _if (input@ = 'C') _then _(
          get(input);
          getDec(pnum);
          _goto start;
        _) _else _if (input@ = 'L') _then _(
          get(input);
          lpp := ord(input@);
          _if doLnum _then lpp := lpp-1;
        _) _else _if input@ > '4' _then
          interl := 4
        _else _(
          interl := ord(input@);
          (q) _exit q;
        _);
        (* 2012 *)
        get(input);
        _goto start;
      _)
    _end _else (* 2025 *) _if (ch > '{200') _then _(
      l2k4z := ord(ch) - 128;
      l2v1a[1] := sp;
      l2k2z := 1;
    _) _else _if (input@ = repl) _then _(
      l2v1a[1] := ch;
      get(input);
      l2k4z := ord(input@);
      l2k2z := 1;
      get(input);
    _) _else _if (ch <> sp) _and mono _then
      _goto 1664
    _else _if (ch _in letter) _then
      _goto 1664
    _else _if (ch _in digit) _then _(
      l2k4z := 1;
      l2v1a[1] := ch;
      l2k2z := 2;
      _while (input@ _in digit) _and (l2k4z < 50) _do _(
        l2k4z := l2k4z + 1;
        l2v1a[l2k4z] := input@;
        get(input);
      _);
    _) _else _(
     l2k2z := 0;
     l2v1a[1] := ch;
     l2k4z := 1;
     (q) _exit q;
    _);
  _);
  2073:
_)_);
_procedure P2126;
_var i, j, len:integer; s: _set _of boolean;
_procedure P2074;
_(
  _for i _to len _do _(
    canvas[pos] := l2v1a[i];
    pos := pos + 1;
  _);
  canvas[pos] := minus;
  pos := pos + 1;
  _for i := len + 1 _to l2k4z _do _(
    l2v1a[i - len] := l2v1a[i];
  _);
  l2k4z := l2k4z - len;
  rem := rem - len - 1;
_);  
_( (* P2126 *)
  _if rem = 57 _then _(
    len := 57;
    P2074;
    exit;
  _);
  _if _not hyphen _then exit;
  s := [];
  _for i _to l2k4z _do _( (* loop1 *)
    s := s + [ord(l2v1a[i]) - 32 _IN vowels];
    _if (s = [false, true]) _then _(
      s := [];
      _for j := l2k4z _downto 1 _do _(
        s := s + [ord(l2v1a[j]) - 32 _IN vowels];
        _if (s = [false, true]) _then _(
          _if (j > rem - 1) _then j := rem - 1;
          _if (j > i) _then _(
            _for len := j _downto i _do _(
              _if (((ord(l2v1a[len]) - 32 _IN vowels) = (ord(l2v1a[len+1]) - 32 _IN vowels)) _and
                   _not (ord(l2v1a[len + 1]) - 32 _IN ЙЬ)) _or
                  (len <> j) _and (ord(l2v1a[len]) - 32 _IN vowels) 
                  _and _not (ord(l2v1a[len + 1]) - 32 _IN vowels)
              _then _(
                 P2074;
                 exit
              _)
            _); exit
          _) _else exit
        _)
      _); exit
    _)
  _) (* loop1 *);
_);
_procedure adjust;
_var i, j:integer;
_(
  _if _not adj _then exit;
  (l) _for i := pos - 1 _downto start _do
    _if (canvas[i] <> sp) _then _exit l _else _(
      pos := pos - 1;
      rem := rem + 1;
    _);
  _for i := pos - 1 _downto start _do
    _if (rem <= 0) _then exit
    _else _if (canvas[i] = sp) _then _(
      _for j := pos - 1 _downto i _do _(
        canvas[j + 1] := canvas[j];
      _);
      pos := pos + 1;
      rem := rem - 1;
    _);
_);

_( (* doLine *)
  _if cont _then _(
    rem := 57;
    _if (l2k23z <> 0) _then addSp(l2k23z);
    _if doLnum _then _(
      _if _not l2k26z _then _(
        rem := rem - 5;
        canvas[pos] := chr(lineno _DIV 1000);
        pos := pos + 1;
        canvas[pos] := chr(lineno _MOD 1000 _DIV 100);
        pos := pos + 1;
        canvas[pos] := chr(lineno _MOD 100 _DIV 10);
        pos := pos + 1;
        canvas[pos] := chr(lineno _MOD 10);
        pos := pos + 1;
        canvas[pos] := sp;
        pos := pos + 1;
        lineno := lineno + 1;
        l2k26z := true;
      _) _else addSp(5);
    _);
    _if l2k16z _then 
      l2k16z := false
    _else
      P1552;
    _if (l2k2z = 0) _and (l2v1a[1] = sp) _and _not doLnum _then P1552;
    _while l2k4z <= rem _do _(
      P1441;
      rem := rem - l2k4z;
      P1552;
    _);
    _if (rem > 57 - 20) _and (l2k2z = 2) _then _(
      _for i _to rem _do _(
        canvas[pos] := l2v1a[i];
        pos := pos + 1;
      _);
      _for i := rem + 1 _to l2k4z _do _(
        l2v1a[i - rem] := l2v1a[i];
      _);
      l2k4z := l2k4z - rem;
      rem := 0;
      l2k16z := true;
    _) _else _case l2k2z _of
      0: _if (ord(l2v1a[1]) _IN [10..17,19..22,25..28,30,31]) _then _(
          P1441;
          rem := rem - 1;
        _) _else 
          l2k16z := true;
      1: _(
        l2k4z := l2k4z - rem;
        _for rem := rem _downto 1 _do _(
          canvas[pos] := l2v1a[1];
          pos := pos + 1;
        _);
         l2k16z := true;
         rem := 0;
      _);
      2: _( P2126; l2k16z := true _)
      _end;
    adjust;
  _); 2472:
  canvas[pos] := eol;
  pos := (pos + 1);
_);
_procedure P2476;
_var len, half, i, last, next:integer;
_(
  _if (rem > 4) _then _(
    half := rem _div 2;
    next := pos + half;
    last := next - 1;
    pos := pos - 1;
    len := 57 - rem + 1;
    _for i _to len _do _(
      canvas[last] := canvas[pos];
      last := last - 1;
      pos := pos - 1;
    _);
    _for i _to half _do _(
      canvas[start] := sp;
      start := start + 1;
    _);
    pos := next;
  _)
_);
_( (* P2535 *)
  cont := odd(conti);
  _for cur _to lpp _do _(
    center := false;
    doLine;
    _if l2k14z _then P2476;
    _for l2k8z _to interl _do _(
      cur := cur + 1;
      _if cur <= lpp _then _(
        canvas[pos] := eol;
        pos := pos + 1;
      _)
    _);
    start := pos;
    l2k14z := center;
    center := false;
  _);
_);
_procedure HR;
_(
 writeln('{131{174{176');  writeLN; writeLN; writeLN;
_);
_procedure doPage;
_(
  HR;
  cur := 1;
  l2k8z := right;
  _if (pgleft <> 0) _then _(
    write('{173*  - ');
    write(pgleft:1);
    write(' -');
  _);
  _if (pgright <> 0) _then _(
    write(sp:26);
    write('{173"  - ');
    write(pgright:1);
    write(' -');
  _);
  writeln(eol, eol);
  _repeat
    write('  ');
    _while (canvas[cur] <> eol) _do _(
      write(canvas[cur]);
      cur := cur + 1;
    _);
    cur := cur + 1;
    write('{173N');
    _while (canvas[l2k8z] <> eol) _do _(
      write(canvas[l2k8z]);
      l2k8z := l2k8z + 1;
    _);
    l2k8z := l2k8z + 1;
    writeLN;
  _until cur = right;
  _if doLnum _then writeLN;
  writeLN;
  writeLN;
  writeLN;
  writeLN;
_);
_procedure init;
_(
  mono := true;
  adj := true;
  l2k20z := ['К'..'Н','З','И','Е','-'];
  hyphen := true;
  l2k14z := false;
  l2k23z := 0;
  l2k16z := false;
  pnum := 1;
  conti := 1;
  vowels := [0,5,8,14,19,26,28:30,34,35,41];
  doLnum := false;
  lineno := 2;
  l2k26z := false;
  lpp := 58;
  ЙЬ := [9,27];
  interl := 0;
_);
_( (* P2707 *)
  init;
  writeln('ПАСКАЛЬ-ПРОГРАММА ЛИСТИНГ В ДВЕ КОЛОНКИ.ВЕРС ОТ 14.02.80':73);
  writeLN;
  _repeat
    pos := 1;
    start := pos;
    P2535;
    pgleft := pnum;
    pnum := pnum + 1;
    right := pos;
    P2535;
    pgright := pnum;
    pnum := pnum + 1;
    _if inMap(pgleft, pagemap) _or inMap(pgright,  pagemap) _then
      doPage;
  _until conti = 0;
  HR;
  writeLN;
_);

_function e65(addr:integer):integer;
_(
  code(2ИК4=Э0650,);
  e65 := ;
_);

_function remPaper:integer;
_var l2v1z, l2v2z: word;
_(
  l2v2z.i := e65(IPZ + 32);
  l2v1z.s := l2v2z.s _mod [0..47];
  remPaper := l2v1z.i _mod 65536 * 192 _div 460;
_);
_procedure sleep(tics:integer);
_var t:integer;
_(
  tics := shift(tics, 2);
  _while tics > 0 _do _(
    _if tics > 2044 _then t := 2044
    _else t := tics;
    tics := tics - t;
    code(2сч4=э0507700,);
  _);
_);
_procedure GETS;
_(
  BIND(' =-> {172');
_);
_function getVol(n, u: integer):integer;
_var i, j, k:integer;
_(
  code(2сч4=сд/-3/,2лс5=сд/-14/,э050105=,);
  n := ;
  u := 0;
  j := 4096;
  _for i _to 4 _do _(
    k := n _div j;
    n := n - k * j;
    j := j _div 16;
    u := k + u * 10;
 _);
 getVol := u;
_);
_procedure noecho(l2a1z:boolean);
_(
  code(иа76403=сч,17зч1=сч13,сд/-45/=17лу1,17ср1=17зч1,2сч3=сд/-45/,17лс1=иа76403,зч=);
_);
_procedure P3056(vol, mode:integer);
_var l2v1z:alfa; pass:integer; hexvol, rw:alfa; l2v5z:mask; l2v6z:integer;
_(
  l2v1z := '00    ';
  l2v6z := mode;
  hexvol := ITOA(vol);
  code(2сб5=сд/40/,);  hexvol := ;
  code(=э050127,сд/2/=мр,);
  l2v5z := ;
  _if l2v6z _IN l2v5z _then _(
    _if mode = 1 _then rw := 'Ь СЧ ?' _else rw := 'Ь ЗП ?';
    writeln('ПАРОЛ', rw);
    noecho(true);
    GETS;
    noecho(false);
    pass := getNum(8);
  _) _else
    pass := 0;
  _if mode = 1 _then pass := pass + 40000C;
  code(2сч6=уи15,2сч7=э050121,);
_);
_function isBusy(l2a1z:integer):integer;
_label 3203;
_var l2v1z, u, l2v3z, l2v4z, l2v5z, l2v6z, l2v7z:integer;
_procedure P3127(n:integer);
_(
  l2v5z := (n - 3) * 8 - 1;
  _for u _to 8 _do _(
    l2v3z := l2v5z + u;
    code(уи7=7са623,7э065=,);
    l2v7z := ;
    code(ви7=);
    l2v1z := ;
    l2v4z := l2v7z _mod 4096;
    _if (l2v4z = l2a1z) _then _(
      n := n;
      code(сд/-3/=17зч,);
      u := u;
      code(17лс=сд/-17/,17зч=);
      l2v1z := l2v1z;
      code(17лс=);
      l2v1z := ;
      _GOTO 3203;
    _)
  _);
_);
_( (* 3162 *)
  _if l2a1z < 2048 _then _(
    _for l2v6z := 6 _downto 3 _do _(
      P3127( l2v6z );
    _);
  _) _else _(
    _for l2v6z := 7 _to 11 _do _(
      P3127( l2v6z );
    _);
  _);
  l2v1z := 0;
  3203:
  isBusy := l2v1z;
_);
_procedure БОБ(mode:integer);
_label 3261,3312;
_var l2v1z, l2v2z:alfa; l2v3z, vol, l2v5z, l2v6z:integer; l2v7z:boolean;
_procedure volNum;
_(
 write('БОБИНА');
 write(vol:5);
_);
_(
  _if mode = 0 _then _(
    _if bibVol = 0 _then _(
      writeln('НЕТ ОБЩЕЙ БИБЛИОТЕКИ');
      _GOTO 4521;
    _);
    vol := bibVol;
  _) _else _(
    _if input@ = etx _then _(
      writeln('НОМЕР БОБИНЫ ?');
      GETS;
    _);
    vol :=   getNum(10);
    _if vol = 0 _then _(
      writeln('НЕПОНЯТНО');
      exit
    _)
  _);
  volNum;
  _if curVol = vol _then _(
    writeln(' УЖЕ ЕСТЬ');
    exit
  _);
  _if curVol <> 0 _then release;
  _if reqVol(vol) _then _(
    _if mode > 0 _then _(
 3261:
      writeln(' ПРИНЯТА');
    _) _else 
    rewrite(output);
  _) _else _(
    _if isBusy(vol) > 0 _then _(
      writeln(' ЗАНЯТА');
      _GOTO 4521;
    _);
    code(сч=зч17,); (* '!ФИКТ!' := 0 *)
    task( vol );
    writeln(' ЗАКАЗАНА');
    l2v2z := ITOA(vol);
    l2v1z := '00    ';
    l2v5z := 0;
    l2v7z := true;
  3312:
    sleep(50);
    _for l2v3z _to 8 _do write(empty);
    write('ЖДИТЕ');
    status;
    code(сч17=2зч6,); (* l2v3z := '!ФИКТ!' *)
    _if l2v3z <> magic _then _(
      _if (l2v5z _mod 4 = 0) _and l2v7z _then _(
        code(2сч5=2сб4,сд/40/=3па71717,э0501206=,);
        l2v6z := ;
        _if l2v6z = vol _then _(
          volNum;
          writeln(' УСТАНОВЛЕНА');
          l2v7z := false;
        _);
      _);
      l2v5z := l2v5z + 1;
      _if l2v5z = 32 _then l2v7z := false;
      sleep( 100 );
      sleep( 100 );
      _goto 3312;
    _) _else _(
      volNum;
      gl12z := false;
      _goto 3261;
    _)
  _); (* 3362 *)
  curVol := vol;
  valid := false;
  P3056(vol, 1);
_);
_procedure АРХБИБ(l2a1z:integer);
_label 3474;
_var aname:alfa; l2v2z, l2v3z, l2v4z, nzone: integer;
_(
  _if l2a1z = 0 _then _(
    aname := bibName;
    nzone := bibZone;
  _) _else _(
    _if input@ = etx _then _(
      writeln('ИМЯ АРХИВА ?');
      GETS;
    _);
    getAlfa(aname);
    _if input@ = etx _then _(
      writeln('НАЧЗОНА АРХИВА ?');
      GETS;
    _);
    nzone := getNum(8);
  _);
  _if curVol = 0 _then _(
    writeln('БОБИНА НЕ ЗАДАНА');
    exit
  _);
  (* 3424 *)
  gl14z := aname;
  readZone(50C, nzone);
  gl18z := 0;
  _if (aname <> pptr@[0].a) _then _(
    writeln('НЕТ НА МЕСТЕ АРХИВА');
    exit
  _);
  _for l2v2z _to 50 _do _(
    l2v3z := l2v2z*2;
    aname := pptr@[l2v3z-1].a;
    _if (aname = zz) _then _goto 3474;
    files2[l2v2z] := aname;
    l2v3z := pptr@[l2v3z].i;
    l2v4z := l2v3z _div m24e1;
    l2v3z := l2v3z _mod m24e1;
    fileLoc[l2v2z] := l2v3z*4096 + l2v4z + nzone;
    write(aname:7);
    _if l2v2z _MOD 6 = 0 _then writeln;
    gl18z := l2v2z;
  _);
 3474:
  writeln(' =-< ВСЕ >-=');
  valid := true;
_);
_procedure freeTerm(l2a1z: integer);
_(
  code(7паисэ=2сч3,7лс=,2зч3=2э0713,7пб1=,к;исэ:сб70002=,)
_);
_procedure relTerm;
_var l2v1z, l2v2z: word;
_(
  writeln('-=  БУДЕТ СДЕЛАНО  =-':30);
  writeln('-ТЕРМИНАЛ ОСВОБОЖДЕН-':30);
  l2v1z.i := 2;
  code(зч76013=);
  writeln('ВКЛЮЧЕНА ПЕЧАТЬ');
  l2v1z.s := [0..47];
  code(17зч1=17э0711,);
  l2v2z := ;
  freeTerm(minel(l2v2z.s) + 1);
_);
_procedure СОДПЕЧ(сод:boolean);
_label 3743, 4120;
_var l2v1z, l2v2z, l2v3z, l2v4z, l2v5z, ekz, l2v7z, l2v8z, l2v9z, copies:integer;
l2v11z, l2v12z, l2v13z:integer; fname, OTBET:alfa; l2v16z, l2v17z, l2v18z :boolean; 
CAM:boolean; 
  name:unp; l2v26z:char;
_function findFile(l3a1z:alfa):integer;
_var l3v1z:integer;
_(
  _if _not valid _then _(
    writeln('АРХИВ НЕ ЗАДАН');
    _GOTO 4521;
  _);
  _for l3v1z _to gl18z _do _(
    _if (l3a1z = files2[l3v1z]) _then _(
      findFile := fileLoc[l3v1z];
      exit
    _)
  _);
  writeln('МАССИВ ', l3a1z, ' НЕ НАЙДЕН');
  _GOTO 4521;
_);
_( (* 3566 *)
  l2v7z := 1;
  l2v16z := false;
  l2v17z := ;
  l2v18z := ;
  _if input@ = etx _then _(
    writeln('ИМЯ МАССИВА ?');
    GETS;
    l2v16z := true;
  _);
  _if input@ _in digit _then _(
    l2v1z :=   getNum( 8 );
    l2v17z := true;
    _if (input@ = etx) _then _(
      writeln('ЧИСЛО ЗОН (ВОСЬМ) ?');
      GETS;
    _);
    _if input@ = colon _then _(
      get(input);
      skipsp;
    _); (* 3622 *)
    _if _not (input@ _in digit) _then _(
      writeln('НЕТ ЧИСЛА ЗОН');
      exit
    _);
    l2v2z :=   getNum(8);
    _if l2v2z > 30 _then _(
      writeOct(l2v2z, 4);
      writeln(' - МНОГО ЗОН');
      exit
    _); (* 3643 *)
    gl33z[l2v7z] := 4096*l2v2z + l2v1z;
    files1[l2v7z] := zz;
  _) _else _( (* 3651 *)
    getAlfa(fname);
    _if fname = zz _then _(
      writeln('НЕТ ИМЕНИ МАССИВА');
      exit
    _);
    files1[l2v7z] := fname;
    gl33z[l2v7z] := 0;
  _); (* 3664 *)
  _if input@ = '(' _then _(
    _if readMap(pagemap) _then _(
      writeln('БОЛЬШОЙ НОМЕР СТРАНИЦЫ');
      _GOTO 4521;
    _)
  _) _else
   _for l2v3z := 0 _to 9 _do
     pagemap[l2v3z] := [0..47];
  copies := 1;
  OTBET := spaces;
  _if сод _then CAM := false
  _else _(
    _if (input@ = etx) _and l2v16z _then _(
      writeln('ЧИСЛО ЭКЗ ?');
      GETS;
    _);
    _if input@ _in digit _then _(
      copies := getNum(10);
      _if input@ _in letter _then
        getAlfa(OTBET)
      _else _(
        _if l2v16z _then _goto 3743;
      _)
    _) _else _(
      _if input@ _in letter _then
        getAlfa(OTBET)
      _else _(
        _if l2v16z _then _(
        3743:
          writeln('САМ <ДА,НЕТ> ?');
          GETS;
          getAlfa(OTBET);
        _)
      _)
    _)
  _); (* 3753 *)
  CAM := (OTBET = 'САМ   ') _or (OTBET = 'ДА    ') _or 
    (OTBET = 'С     ') _or (OTBET = 'Д     ');
  CAM := CAM _and _not сод;
  _if CAM _then relTerm;
  _if (fname = 'ВСЕ   ') _or (fname = gl14z) _then _(
    l2v7z := gl18z;
    l2v18z := true;
    files1 := files2;
  _);
  (* 4007 *)
  _for l2v1z _to l2v7z _do (q) _(
    fname := files1[l2v1z];
    _if (fname = zz) _then 
      l2v4z := gl33z[l2v1z]
    _else 
      l2v4z := findFile(fname);
    l2v8z := l2v4z _mod 4096;
    l2v9z := l2v4z _div 4096;
    (loop) _for ekz _to copies _do _(
      _if fname = zz _then
         write(spaces)
      _else
         write(fname);
      code(сч22=14пв74053,); (* write(sp); *)
      writeOct( l2v8z, 4);
      code(=сч22,14пв74053=,); (* write(sp); *)
      writeOct( l2v9z, 2);
      status;
      _if сод _then _(
        readZone(50C, l2v8z);
        _if (pptr@[0].a <> 'ЬЬ-   ') _then _(
          write('АННОТАЦИИ НЕТ');
          status;
          _exit loop;
        _);
        _for ekz _to 511 _do _(
          unpck(name[1], pptr@[ekz].a );
          _for l2v5z _to 6 _do _(
            l2v26z := name[l2v5z];
            _if (l2v26z = '$') _then _(
              status;
              _exit loop;
            _) _else
              write(l2v26z)
          _)
        _)
      _); (* 4106 *)
      _if (ekz = 1) _then _(
        l2v13z :=   remPaper;
        _if l2v9z * 50 > l2v13z _then
          _goto 4120;        
      _) _else _if (l2v11z < l2v12z) _then _(
      4120:
        writeln('ЭКЗ ', ekz:1, ' - МАЛО БУМАГИ');
        exit
      _);  (* 4130 *)
      _if _not CAM _then 
        write(' + + + +  ОБРАБОТКА ТЕКСТА   + + + +');
      status;
      _for l2v2z _to l2v9z _do _(
        readZone(50C, l2v8z + l2v2z - 1);
        _if (l2v2z = l2v9z) _and l2v17z _then
          pptr@[1023].a := '{172{1750000';
        writeZone(27C, l2v2z - 1);
      _);
      l2v2z := 2;
      code(зч76013=15пв74027,);
      P2707;
      _if _not CAM _then _(
        l2v2z := 1;
        code(зч76013=);
      _);
      l2v11z := remPaper;
      _if ekz = 1 _then 
        l2v12z := l2v13z - l2v11z;
      _if _not CAM _then _(
        write('ЭКЗ ', ekz:1, ' ГОТОВ. ОСТАЛОСЬ БУМАГИ ', l2v11z _div 100:1, dot);
        P0703(l2v11z _MOD 100);
        write(' М.');
        status;
      _);
    _);
  _); (* 4222 *)
  _if (сод _and l2v18z) _or (copies > 1) _then
    writeln(' *--< ВСЕ >--*');
  _if CAM _then code(сч0=э0620,);
_);
_procedure НАШ;
_var nVol, nZone, i:integer; nName, nMask:alfa; a:unp;
_(
  _if input@ = etx _then _(
    writeln('НОМЕР БОБИНЫ ?');
    GETS;
  _);
  nVol := getNum(10);
  _if nVol = 0 _then _(
    nName := 'НЕТНЕТ';
    nZone := 0;
  _) _else _(
    _if input@ = etx _then _(
      writeln('ИМЯ АРХИВА ?');
      GETS;
    _);
    getAlfa(nName);
    _if input@ = etx _then _(
      writeln('НАЧЗОНА АРХИВА ?');
      GETS;
    _);
    nZone := getNum(8);
  _); (* 4276 *)
  _if input@ = etx _then _(
    writeln('ШКАЛА ?');
    BIND(' =-> 0+++++ {172');
  _);
  skipsp;
  _if (input@ = etx) _then _(
    nMask := '++++++';
    unpck( a[1], nMask );
    a[1] := '0';
    pck(a[1], nMask);
  _) _else _(
    _if input@ = eq _then 
      _for i _to 3 _do
        get(input);
    skipsp;
    getAlfa(nMask);
  _);
  write('ВВЕДЕНО:{175', nVol:1, nName:7, sp);
  writeOct(nZone, 4);
  writeln(nMask:7);
  _if curVol <> 0 _then release;
  _if (reqVol(paspVol)) _then
    writeln('БОБИНА', paspVol:5, ' ПРИНЯТА')
  _else code(э0620=,);
  P3056( paspVol, 1);
  P3056( paspVol, 0);
  readZone(50C, myZone);
  pptr@[12].i := nVol;
  prog@[12] := ;
  pptr@[13].a := nName;
  prog@[13] := ;
  pptr@[14].i := nZone;
  prog@[14] := ;
  pptr@[17].a := nMask;
  prog@[17] := ;
  writeZone(50C, myZone);
  release;
  writeln('СДЕЛАНО');
  valid := false;
_);

_procedure P4420;
_var l2v1z:word; l2v2z:integer;
_(
  code(ви7=,иаэ70ис=лс1,17зч1=17э0701,);
  l2v1z.s := [0..47];
  code(2э0713=,э023=2зч4,лс76402=зч76402,сч76404=2лс4,зч76404=);
  l2v2z := l2v2z * 4096;
  code(лс76401=зч76401,сч76403=2лс4,зч76403=);
_);
_procedure ИНФ;
_(
 write('ПРИКАЗЫ СИСТЕМЫ "ТИРАЖ"':29);
 status;
 write('БОБИНА  <НОМЕР БОБИНЫ>
АРХИВ   <ИМЯ АРХИВА> <НАЧЗОНА>
БИБЛИОТЕКА ОБЩАЯ
СОДЕРЖАНИЕ <ИМЯ МАССИВА>
ПЕЧАТАЙ <ИМЯ МАССИВА> [<ЧИСЛО ЭКЗЕМПЛ>] [САМ]
КОНЕЦ
       ПРИМЕЧАНИЯ:
1) ВМЕСТО ИМЕНИ МАССИВА МОЖНО УКАЗАТЬ
   <НАЧЗОНУ> И <ЧИСЛО ЗОН>.
2) СТРАНИЦЫ МОЖНО ОТПЕЧАТАТЬ ВЫБОРОЧНО:
   ПЕЧ <ИМЯ МАС> ( <СПИСОК СТРАНИЦ> ) .
3) СИСТЕМА РАБОТАЕТ С ДОЗАПРОСОМ ПАРАМЕТРОВ ПРИКАЗОВ.
      <*>---------------------------<*>');
 status;
_);
_procedure userid;
_var id, m:alfa; j:integer; u:unp;
_(
  m := '00    ';
  code(э050100=,2рб4=);
  id := ;
  unpck(u[1], id);
  _for j := 3 _to 6 _do _(
    write(u[j]);
  _);
_);

(* main program *)
_(
  code(ви6=); myZone := ;
  prog := ptr(0);
  pptr := _nil; (* 64000 *)
  paspVol := getVol(5, 0);
  P4420;
  release;
  valid := false;
  gl12z := ;
  code(э0650=,);
  IPZ := ;
  IPZ := sel(IPZ, 0, 15);
  paper := remPaper;

  userid;
  writeln(', У ВАС ', paper _div 100 :1, ' МЕТРОВ БУМАГИ');

  4521: (loop) _(
    writeln('ДАЙ РАБОТУ <ИНФ,БОБ,АРХ,БИБ,СОД,ПЕЧ,КОН>');
    GETS;
    gl10z :=   getCmd( cmd );
    _if cmd = 'ИНФ   ' _then ИНФ
    _else _if cmd = 'БОБ   ' _then БОБ(1)
    _else _if cmd = 'АРХ   ' _then АРХБИБ(1)
    _else _if cmd = 'БИБ   ' _then _( БОБ(0); АРХБИБ(0) _)
    _else _if cmd = 'СОД   ' _then СОДПЕЧ(true)
    _else _if cmd = 'ПЕЧ   ' _then СОДПЕЧ(false)
    _else _if (cmd = 'КОН   ') _or (cmd = 'КНЦ   ') _or (cmd = 'F     ') _then _exit loop
    _else _if cmd = 'НАШ   ' _then НАШ
    _else _( writeln('НЕПОНЯТНО'); _goto loop _);
    _goto loop;
  _);
  writeln('  <> Ф И Н А Л <>');
  code(Э0620=,);
_).
