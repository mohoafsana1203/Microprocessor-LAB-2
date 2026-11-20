;ah =9h(str) , ah= 1h(user input) , ah=2h(user output), ah=4ch(exit)
.model small
.stack 100h
.data
dividend db "Enter Dividend: $" ;db means define byte
divisor db 13,10, "Enter Divisor: $" 
quotient db 13,10, "Your quotient: $" 
reminder db 13,10, "YOur reminder:$ "
error db 13,10, "undefined!$"
.code 

main proc
    mov ax,@data
    mov ds,ax
    
    ;case insensetive , identation not mind
    ;ascii pattern = mind kore pattern ulta palta korle 
    ;str print
    
    lea dx,dividend
    mov ah,9h ; for string print
    int 21h  
    
    ;dividend user input
    mov ah,1h ; fixer user input
    int 21h 
    
    ;al=user input nile by default al e jaay , ax(16) = ah(8):al(8)
    ;ascii
    sub al,30h
    mov bl,al ;bl=dividend
    
    
    
    ;str print
    lea dx,divisor
    mov ah,9h ; for string print
    int 21h  
    
    ;divisor user input
    mov ah,1h ; fixer user input
    int 21h 
    ;ascii
    sub al,48
    mov bh,al ;bh=divisor
    
    
    ;corner case
    cmp bh,0
    je undefine ; jump if equal
    
    ;str print
    lea dx,quotient
    mov ah,9h ; for string print
    int 21h
    ;else
    mov al,bl ;quotient store
    xor ah,ah ;ah=remainder=memory clear
    div bh ;divisor
    mov dl,al ; al=quotient
    add dl,'0' ;ascii convert
    mov ah,2h ;user output 
    int 21h 
    jmp exit 
    
    undefine: ;segment
    lea dx,error
    mov ah,9h ;str print
    int 21h 
    

 
    exit:
    mov ah,4ch
    int 21h  
    main endp
end main

;str print
    lea dx,reminder
    mov ah,9h ; for string print
    int 21h 
    
    mov dl,bl
    sub dl,48
    mov ah,2h
    int 21h
    
    jmp exit


