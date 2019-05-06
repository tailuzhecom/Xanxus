declare i32 @strcmp(i8*, i8*)
declare void @abort()
declare i8* @malloc(i32)
; ModuleID = 'Xanxus'
source_filename = "Xanxus"

%Object = type { %Object_vtable* }
%Object_vtable = type {}
%A = type { %A_vtable*, i32, i32 }
%A_vtable = type { i32 (%A*)* }
%B = type { %B_vtable*, i32, i32, i32 }
%B_vtable = type { i32 (%B*)* }
%Main = type { %Main_vtable*, i32, i1, %A* }
%Main_vtable = type { i32 (%Main*)*, i32 (%Main*, i32)*, i32 (%Main*, i1)* }

@0 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@1 = private unnamed_addr constant [9 x i8] c"A::add()\00"
@2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@3 = private unnamed_addr constant [13 x i8] c"add_with_Int\00"
@4 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@5 = private unnamed_addr constant [14 x i8] c"add_with_Bool\00"

declare i32 @printf(i8*, ...)

define void @Object_ctor(%Object* %this) {
entry:
  %0 = getelementptr %Object, %Object* %this, i32 0, i32 0
  %1 = load %Object_vtable*, %Object_vtable** %0
  store %Object_vtable zeroinitializer, %Object_vtable* %1
  ret void
}

define i32 @A_add_0(%A* %this) {
entry:
  %0 = getelementptr %A, %A* %this, i32 0, i32 1
  %1 = getelementptr %A, %A* %this, i32 0, i32 2
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @0, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @1, i32 0, i32 0))
  ret i32 %2
}

define void @A_ctor(%A* %this) {
entry:
  %0 = getelementptr %A, %A* %this, i32 0, i32 0
  %1 = load %A_vtable*, %A_vtable** %0
  store %A_vtable { i32 (%A*)* @A_add_0 }, %A_vtable* %1
  ret void
}

define i32 @B_add_0(%B* %this) {
entry:
  %0 = getelementptr %B, %B* %this, i32 0, i32 1
  %1 = getelementptr %B, %B* %this, i32 0, i32 2
  %2 = getelementptr %B, %B* %this, i32 0, i32 3
  %b = alloca i32
  store i32 0, i32* %b
  ret i32 0
}

define void @B_ctor(%B* %this) {
entry:
  %0 = getelementptr %B, %B* %this, i32 0, i32 0
  %1 = load %B_vtable*, %B_vtable** %0
  store %B_vtable { i32 (%B*)* @B_add_0 }, %B_vtable* %1
  ret void
}

define i32 @Main_main_0(%Main* %this) {
entry:
  %0 = getelementptr %Main, %Main* %this, i32 0, i32 1
  %1 = getelementptr %Main, %Main* %this, i32 0, i32 2
  %2 = getelementptr %Main, %Main* %this, i32 0, i32 3
  %3 = load i32, i32* %0
  %4 = call i32 @Main_add_Int_1(%Main* %this, i32 %3)
  %5 = call i32 @Main_add_Bool_1(%Main* %this, i1 true)
  %6 = load %A*, %A** %2
  %7 = call i32 @A_add_0(%A* %6)
  ret i32 %7
}

define i32 @Main_add_Int_1(%Main* %this, i32 %a) {
entry:
  %0 = getelementptr %Main, %Main* %this, i32 0, i32 1
  %1 = getelementptr %Main, %Main* %this, i32 0, i32 2
  %2 = getelementptr %Main, %Main* %this, i32 0, i32 3
  %3 = alloca i32
  store i32 %a, i32* %3
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @2, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @3, i32 0, i32 0))
  ret i32 %4
}

define i32 @Main_add_Bool_1(%Main* %this, i1 %a) {
entry:
  %0 = getelementptr %Main, %Main* %this, i32 0, i32 1
  %1 = getelementptr %Main, %Main* %this, i32 0, i32 2
  %2 = getelementptr %Main, %Main* %this, i32 0, i32 3
  %3 = alloca i1
  store i1 %a, i1* %3
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @4, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @5, i32 0, i32 0))
  ret i32 %4
}

define void @Main_ctor(%Main* %this) {
entry:
  %0 = getelementptr %Main, %Main* %this, i32 0, i32 0
  %1 = load %Main_vtable*, %Main_vtable** %0
  store %Main_vtable { i32 (%Main*)* @Main_main_0, i32 (%Main*, i32)* @Main_add_Int_1, i32 (%Main*, i1)* @Main_add_Bool_1 }, %Main_vtable* %1
  ret void
}

define void @main() {
entry:
  %0 = alloca %Main
  %1 = call i32 @Main_main_0(%Main* %0)
  ret void
}

declare i32 @puts(i8*)
