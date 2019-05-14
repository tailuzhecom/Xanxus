declare i32 @strcmp(i8*, i8*)
; ModuleID = 'Xanxus'
source_filename = "Xanxus"

%Object_vtable = type {}
%Main_vtable = type { i32 (%Main*)* }
%Main = type { %Main_vtable* }
%Object = type { %Object_vtable* }

@0 = constant %Object_vtable zeroinitializer
@1 = constant %Main_vtable { i32 (%Main*)* @Main_main_0 }
@2 = private unnamed_addr constant [4 x i8] c"%d\0A\00"

declare i32 @printf(i8*, ...)

declare void @abort()

declare i8* @malloc(i32)

define void @Object_ctor(%Object* %this) {
entry:
  %0 = getelementptr %Object, %Object* %this, i32 0, i32 0
  store %Object_vtable* @0, %Object_vtable** %0
  ret void
}

define i32 @Main_main_0(%Main* %this) {
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
  %0 = load i32, i32* %a
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @2, i32 0, i32 0), i32 %0)
  ret i32 %1
}

define void @Main_ctor(%Main* %this) {
entry:
  %0 = getelementptr %Main, %Main* %this, i32 0, i32 0
  store %Main_vtable* @1, %Main_vtable** %0
  ret void
}

define void @main() {
entry:
  %0 = alloca %Main
  call void @Main_ctor(%Main* %0)
  %1 = call i32 @Main_main_0(%Main* %0)
  ret void
}

declare i32 @puts(i8*)
