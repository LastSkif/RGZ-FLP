gl('a').
gl('e').
gl('u').
gl('i').
gl('o').

main:-
 open('C:\\Users\\alast\\Desktop\\FLPRGZ\\in.txt',read,S1),load(S1,'',S),close(S1),
 atomic_list_concat(L,' ',S),
 maxglas(L,LM),
 open('C:\\Users\\alast\\Desktop\\FLPRGZ\\out.txt',write,S2),save(S2,LM),close(S2),!.

load(SF,S,S):-at_end_of_stream(SF).
load(SF,S,S2):-
 read_line_to_codes(SF,C),
 atom_chars(N,C),
 atom_concat(N,' ',N1),
 atom_concat(S,N1,S1),
 load(SF,S1,S2).

maxglas([H|T],R):-getl(H,L),maxgl(T,L,[H],R).

maxgl([],_,R,R).
maxgl([H|T],M,_,R):-getl(H,L),L>M,add([H],[],R2),maxgl(T,L,R2,R).
maxgl([H|T],M,R1,R):-getl(H,L),L=:=M,add([H],R1,R2),maxgl(T,M,R2,R).
maxgl([_|T],M,R1,R):-add([],R1,R2),maxgl(T,M,R2,R).

save(_,[]).
save(SF,[H|T]):-write(SF,H),nl(SF),save(SF,T).

add([],L3,L3).
add([H],L2,L3):-not(member(H,L2)),append(L2,[H],L3).
add([_],L2,L3):-append(L2,[],L3).

getl(S,N):-atom_chars(S,C),getln(C,0,N).

getln([],N,N).
getln([H|T],N,N2):-gl(H),!,N1 is N + 1,getln(T,N1,N2).
getln([_|T],N,N2):-getln(T,N,N2).
