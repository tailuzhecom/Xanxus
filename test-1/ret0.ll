declare i32 @strcmp(i8*, i8*)
; ModuleID = 'Xanxus'
source_filename = "Xanxus"

%Object_vtable = type {}
%A_vtable = type { i32 (%A*)* }
%A = type { %A_vtable* }
%Main_vtable = type { i32 (%Main*)* }
%Main = type { %Main_vtable*, %A* }
%Object = type { %Object_vtable* }

@0 = constant %Object_vtable zeroinitializer
@1 = constant %A_vtable { i32 (%A*)* @A_add_0 }
@2 = constant %Main_vtable { i32 (%Main*)* @Main_main_0 }
@3 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@4 = private unnamed_addr constant [9 x i8] c"A::add()\00"

declare i32 @printf(i8*, ...)

declare void @abort()

declare i8* @malloc(i32)

define void @Object_ctor(%Object* %this) {
entry:
  %0 = getelementptr %Object, %Object* %this, i32 0, i32 0
  store %Object_vtable* @0, %Object_vtable** %0
  ret void
}

define i32 @A_add_0(%A* %this) {
entry:
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @3, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @4, i32 0, i32 0))
  ret i32 %0
}

define void @A_ctor(%A* %this) {
entry:
  %0 = getelementptr %A, %A* %this, i32 0, i32 0
  store %A_vtable* @1, %A_vtable** %0
  ret void
}

define i32 @Main_main_0(%Main* %this) {
entry:
  %0 = getelementptr %Main, %Main* %this, i32 0, i32 1
  ret i32 0
}

define void @Main_ctor(%Main* %this) {
entry:
  %0 = getelementptr %Main, %Main* %this, i32 0, i32 0
  store %Main_vtable* @2, %Main_vtable** %0
  %1 = getelementptr %Main, %Main* %this, i32 0, i32 1
  %2 = load %A*, %A** %1
  call void @A_ctor(%A* %2)
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
