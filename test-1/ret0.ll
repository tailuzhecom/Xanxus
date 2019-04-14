declare i32 @strcmp(i8*, i8*)
declare i32 @printf(i8*, ...)
declare void @abort()
declare i8* @malloc(i32)
; ModuleID = 'Xanxus'
source_filename = "Xanxus"

@0 = private unnamed_addr constant [14 x i8] c"hello world!\0A\00"

define void @main() {
entry:
  %0 = call i32 @puts(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @0, i32 0, i32 0))
  ret void
}

declare i32 @puts(i8*)
