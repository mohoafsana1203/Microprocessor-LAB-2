.model small
.stack 100h
.data
.code

main proc
    mov ax,@data 
    mov ds,ax 
    
    mov ax, 0
    mov dx, 1
    add dx, ax
    ;add dx, '0' ;can convert like these 3 
    ;add dx,48   ;can convert like these 3 
    add dx,30h   ;can convert like these 3 
    
    mov ah,2 ;character print must need 
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
       
    main endp
end main