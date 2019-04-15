declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
; ModuleID = 'Xanxus'
source_filename = "Xanxus"

@0 = private unnamed_addr constant [14 x i8] c"hello world!\0A\00"

define void @Main_main() {
entry:
  %a = alloca i32
  store i32 0, i32* %a
  br i1 true, label %then, label %else

then:                                             ; preds = %entry
  store i32 3, i32* %a
  br label %merge

else:                                             ; preds = %entry
  store i32 5, i32* %a
  br label %merge

merge:                                            ; preds = %else, %then
  %phi_val = phi i32 [ 3, %then ], [ 5, %else ]
  br i1 false, label %then1, label %else2

then1:                                            ; preds = %merge
  store i32 3, i32* %a
  br label %merge3

else2:                                            ; preds = %merge
  store i32 5, i32* %a
  br label %merge3

merge3:                                           ; preds = %else2, %then1
  %phi_val4 = phi i32 [ 3, %then1 ], [ 5, %else2 ]
  ret void
}

define void @main() {
entry:
  %0 = call i32 @puts(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @0, i32 0, i32 0))
  call void @Main_main()
  ret void
}

declare i32 @puts(i8*)
