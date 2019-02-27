.model medium
.stack 100h
.data
     msg db 'There is no middle letter in the word.$' 
     inMsg db 'A word that contains 3 letters =  $' 
     a db ?
     b db ?
     c db ?
    
.code


MAIN proc
        mov ax, @DATA
        mov ds, ax
        
        mov ah, 09h
        lea dx, inMsg
        int 21h
        
        mov ah, 01h
        int 21h 
        mov a, al
        
        mov ah, 01h
        int 21h
        mov b, al
        
        mov ah, 01h
        int 21h
        mov c, al 
        
        call NewLine
        
        mov dl, a
        cmp dl, b
        jle NEXT1
        xchg dl, b
        mov a, dl
        
        NEXT1:
        mov dl, b
        cmp dl, c
        jle NEXT2
        xchg dl, c
        mov b, dl
        
        NEXT2:
        mov dl, a
        cmp dl, b
        jle NEXT3
        xchg dl, b
        mov a, dl
        
        NEXT3:
        mov dl, b
        cmp dl, c
        jle STOP
        xchg dl, c
        mov b, dl
        
        STOP:
        mov dl, a
        cmp dl, b
        jz FINAL
        mov dl, b
        cmp dl, c
        jz FINAL
        
        mov ah, 02h
        mov dl, b
        int 21h
        
        call NewLine
        jmp FINISH
        
        FINAL:
        lea dx, msg
        mov ah, 09h
        int 21h
        call NewLine
        
        FINISH:
        mov ah, 4ch
        int 21h
    MAIN endp 
    
    NewLine proc
        mov ah, 02h
        mov dl, 0dh
        int 21h
        mov dl, 0ah
        int 21h
        ret
    NewLine endp

end MAIN