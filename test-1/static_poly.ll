declare i32 @strcmp(i8*, i8*)
; ModuleID = 'Xanxus'
source_filename = "Xanxus"

%Object_vtable = type {}
%Main_vtable = type { i32 (%Main*)*, i32 (%Main*, i32)*, i32 (%Main*, i1)* }
%Main = type { %Main_vtable*, i32, i1 }
%Object = type { %Object_vtable* }

@0 = constant %Object_vtable zeroinitializer
@1 = constant %Main_vtable { i32 (%Main*)* @Main_main_0, i32 (%Main*, i32)* @Main_add_Int_1, i32 (%Main*, i1)* @Main_add_Bool_1 }
@2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@3 = private unnamed_addr constant [13 x i8] c"add_with_Int\00"
@4 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@5 = private unnamed_addr constant [14 x i8] c"add_with_Bool\00"

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
  %0 = getelementptr %Main, %Main* %this, i32 0, i32 1
  %1 = getelementptr %Main, %Main* %this, i32 0, i32 2
  %2 = load i32, i32* %0
  %3 = call i32 @Main_add_Int_1(%Main* %this, i32 %2)
  %4 = call i32 @Main_add_Bool_1(%Main* %this, i1 true)
  ret i32 %4
}

define i32 @Main_add_Int_1(%Main* %this, i32 %a) {
entry:
  %0 = getelementptr %Main, %Main* %this, i32 0, i32 1
  %1 = getelementptr %Main, %Main* %this, i32 0, i32 2
  %2 = alloca i32
  store i32 %a, i32* %2
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @2, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @3, i32 0, i32 0))
  ret i32 %3
}

define i32 @Main_add_Bool_1(%Main* %this, i1 %a) {
entry:
  %0 = getelementptr %Main, %Main* %this, i32 0, i32 1
  %1 = getelementptr %Main, %Main* %this, i32 0, i32 2
  %2 = alloca i1
  store i1 %a, i1* %2
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @4, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @5, i32 0, i32 0))
  ret i32 %3
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
