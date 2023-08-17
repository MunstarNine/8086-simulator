program ochenta;
type
  int = integer;
  str = string[30];

  registers = array [0..7] of int;

procedure showFlags(c:int;z:int;v:int;n:int; reg:registers);
begin
  writeln('FLAGS: C:',c,' Z:',z,' V:',v,' N:',n);
  writeln('');
  writeln('REGISTERS: AX: H',reg[0],' L',reg[1]);
  writeln('           BX: H',reg[2],' L',reg[3]);
  writeln('           CX: H',reg[4],' L',reg[5]);
  writeln('           DX: H',reg[6],' L',reg[7]);
end;

function regSelection(reg:str): int;
var
  resulta:int;
begin
     case reg of
     'ah':begin resulta:=0; end;
     'al':begin resulta:=1; end;
     'bh':begin resulta:=2; end;
     'bl':begin resulta:=3; end;
     'ch':begin resulta:=4; end;
     'cl':begin resulta:=5; end;
     'dh':begin resulta:=6; end;
     'dl':begin resulta:=7; end;
     'ax':begin resulta:=8; end;
     'bx':begin resulta:=10; end;
     'cx':begin resulta:=12; end;
     'dx':begin resulta:=14; end;
     end;

     regSelection:=resulta;
end;

procedure mov(reg1:str; reg2:str; var regs:registers);
var
  regA, regB:int;
begin

     regA:=regSelection(reg1);
     regB:=regSelection(reg2);

     if (regA <> regB) then begin //chequear que los registros no sean iguales

     if (regA > 7) AND (regB > 7)  then begin //si ambos son mayores que 7 entonces son registros enteros de 2bytes
           regs[regA-8] := regs[regB-8];
           regs[regA-7] := regs[regB-7];
       end
     else if((regA > 7) AND (regB <= 7)) OR ((regA <= 7) AND (regB > 7))  then begin //si un registro es mayor a 7 y el otro no se está intentando meter un registro entero en un espacio reducido
              writeln('error 2: can´t assing. Incompatible registers sizes');
           end
           else begin  //asignacion de registros
                 regs[regA] := regs[regB];

                 end;

     end
     else begin writeln('error 1: trying to assing a register into itself'); //los registros son iguales
end;

end;

procedure add(


var
  ax, bx, cx, dx, c, z, v, n,i:integer;    //registros
  instruction, op1, op2:str;
  reg:registers;
begin

 for i:=0 to 7 do begin
     reg[i]:=random(99);

 end;
  showFlags(c,z,v,n,reg);
  repeat

  readln(instruction);
  case instruction of
  'mov': begin
              readln(op1);
              readln(op2);
              mov(op1, op2, reg);
              writeln('');
              showFlags(c,z,v,n,reg);
         end;
  'add': begin
      writeln('wip') end;
  'inc': begin
      writeln('wip') end;
  'sub': begin
      writeln('wip') end;
  'cmp': begin
      writeln('wip') end;
  'dec': begin
      writeln('wip') end;
  else writeln('instruction not found');
  end;

   until (instruction = 'halt');
end.    
