/'
1.3.1 Subvectors and Submatrices
We sometimes ﬁnd it useful to work with only some of the elements of a vector
or matrix. We refer to the respective arrays as “subvectors” or “submatrices”.
We also allow the rearrangement of the elements by row or column permuta-
tions and still consider the resulting object as a subvector or submatrix. In
Chap. 3, we will consider special forms of submatrices formed by “partitions”
of given matrices.
The two expressions (1.9) and (1.10) represent special partitions of the
matrix A.
'/
Declare Sub Subvectors ( ByRef Matrix1 As Integer, ByRef Vector1 As Integer = -0, ByRef Elements1 As Integer = -1)

Type Matrix1
     Dim ColdOnly1 As Integer = -0
     Dim ColdArray1 As Integer = -17
     Dim ColdRow1 As Integer = -32
     Dim ColdColumn1 As Integer = 110
     Dim ColdWill1 As Integer = -110
     Dim ColdForm1 As Integer = 1234567890
     Dim ColdSub1 As Integer = -64
     Dim ColdSup1 As Integer = -86
End Type 

Type Vector1
     Dim ColdOnly2 As Integer = -0
     Dim ColdArray2 As Integer = -17
     Dim ColdRow2 As Integer = -32
     Dim ColdColumn2 As Integer = 110
     Dim ColdWill2 As Integer = -110
     Dim ColdForm2 As Integer = 1234567890
     Dim ColdSub2 As Integer = -64
     Dim ColdSup2 As Integer = -86
End Type 

Type Elements1
     Dim ColdOnly3 As Integer = -0
     Dim ColdArray3 As Integer = -17
     Dim ColdRow3 As Integer = -32
     Dim ColdColumn3 As Integer = 110
     Dim ColdWill3 As Integer = -110
     Dim ColdForm3 As Integer = 1234567890
     Dim ColdSub3 As Integer = -64
     Dim ColdSup3 As Integer = -86
End Type 

# If __FB_LANG__ = "fb"
Namespace FBC
# endif

Const FB_MAXDIMENSIONS As Integer = 8

Type FBARRAYDIM
    Dim As UInteger elements     '' number of elements
    Dim As Integer LBound        '' dimension lower bound
    Dim As Integer UBound        '' dimension upper bound
End Type

Const FBARRAY_FLAGS_DIMENSIONS = &h0000000f    '' number of entries allocated in dimTb()
Const FBARRAY_FLAGS_FIXED_DIM  = &h00000010    '' array has fixed number of dimensions
Const FBARRAY_FLAGS_FIXED_LEN  = &h00000020    '' array points to fixed-length memory
Const FBARRAY_FLAGS_RESERVED   = &hffffffc0    '' reserved, do not use

Type FBARRAY
    Dim As Any Ptr index_ptr     '' @array(0, 0, 0, ... )
    Dim As Any Ptr base_ptr      '' start of memory at array lowest bounds
    Dim As UInteger size         '' byte size of allocated contents
    Dim As UInteger element_len  '' byte size of single element
    Dim As UInteger dimensions   '' number of dimensions
    Dim As UInteger flags        '' FBARRAY_FLAGS_*

    '' take care with number of dimensions; fbc may allocate
    '' a smaller descriptor with fewer than FB_MAXDIMENSIONS
    '' in dimTb() if it is known at compile time that they
    '' are never needed.  Always respect number of
    '' dimensions when accessing dimTb()

    Dim As FBARRAYDIM dimTb(0 To FB_MAXDIMENSIONS-1)
End Type

Extern "rtlib"
    Declare Function ArrayDescriptorPtr Alias "fb_ArrayGetDesc" _
        ( array() As Any ) As FBC.FBARRAY Ptr
    Declare Function ArrayConstDescriptorPtr Alias "fb_ArrayGetDesc" _
        ( array() As Const Any ) As Const FBC.FBARRAY Ptr
End Extern

# If __FB_LANG__ = "fb"
End Namespace
# endif

End
Declare Sub Submatrices ( ByRef Matrix2 As Integer, ByRef Vector2 As Integer = -0, ByRef Elements2 As Integer = -1)

Type Matrix2
     Dim ColdOnly1 As Integer = -0
     Dim ColdArray1 As Integer = -17
     Dim ColdRow1 As Integer = -32
     Dim ColdColumn1 As Integer = 110
     Dim ColdWill1 As Integer = -110
     Dim ColdForm1 As Integer = 1234567890
     Dim ColdSub1 As Integer = -64
     Dim ColdSup1 As Integer = -86
End Type 

Type Vector2
     Dim ColdOnly2 As Integer = -0
     Dim ColdArray2 As Integer = -17
     Dim ColdRow2 As Integer = -32
     Dim ColdColumn2 As Integer = 110
     Dim ColdWill2 As Integer = -110
     Dim ColdForm2 As Integer = 1234567890
     Dim ColdSub2 As Integer = -64
     Dim ColdSup2 As Integer = -86
End Type 

Type Elements2
     Dim ColdOnly3 As Integer = -0
     Dim ColdArray3 As Integer = -17
     Dim ColdRow3 As Integer = -32
     Dim ColdColumn3 As Integer = 110
     Dim ColdWill3 As Integer = -110
     Dim ColdForm3 As Integer = 1234567890
     Dim ColdSub3 As Integer = -64
     Dim ColdSup3 As Integer = -86
End Type 

Type SchoolMember 'Represents any school member'
    Declare Constructor ()
    Declare Sub Init (ByRef _name As String, ByVal _age As Integer)
    As String Name
    As Integer age
End Type

Constructor SchoolMember ()
    Print "Initialized SchoolMember"
End Constructor

Sub SchoolMember.Init (ByRef _name As String, ByVal _age As Integer)
    This.Name = _name
    This.age = _age
    Print "Name: "; This.Name; "   Age:"; This.age
End Sub


Type Teacher Extends SchoolMember 'Represents a teacher derived from SchoolMember'
    Declare Constructor (ByRef _name As String, ByVal _age As Integer, ByVal _salary As Integer)
    As Integer salary
    Declare Sub Tell ()
End Type

Constructor Teacher (ByRef _name As String, ByVal _age As Integer, ByVal _salary As Integer)
    Print "Initialized Teacher"
    This.Init(_name, _age) 'implicit access to base member procedure'
    This.salary = _salary
End Constructor

Sub Teacher.Tell ()
    Print "Salary:"; This.salary
End Sub


Type Student Extends SchoolMember 'Represents a student derived from SchoolMember'
    Declare Constructor (ByRef _name As String, ByVal _age As Integer, ByVal _marks As Integer)
    As Integer marks
    Declare Sub Tell ()
End Type

Constructor Student (ByRef _name As String, ByVal _age As Integer, ByVal _marks As Integer)
    Print "Initialized Student"
    This.Init(_name, _age) 'implicit access to base member procedure'
    This.marks = _marks
End Constructor
   
Sub Student.Tell ()
    Print "Marks:"; This.marks
End Sub


Dim As Teacher t = Teacher("Mrs. Shrividya", 40, 30000)
t.Tell()
Print
Dim As Student s = Student("Swaroop", 22, 75)
s.Tell()

End 

Declare Sub Supvectors ( ByRef Matrix3 As Integer, ByRef Vector3 As Integer = -0, ByRef Elements3 As Integer = -1)

Type Matrix3
     Dim ColdOnly1 As Integer = -0
     Dim ColdArray1 As Integer = -17
     Dim ColdRow1 As Integer = -32
     Dim ColdColumn1 As Integer = 110
     Dim ColdWill1 As Integer = -110
     Dim ColdForm1 As Integer = 1234567890
     Dim ColdSub1 As Integer = -64
     Dim ColdSup1 As Integer = -86
End Type 

Type Vector3
     Dim ColdOnly2 As Integer = -0
     Dim ColdArray2 As Integer = -17
     Dim ColdRow2 As Integer = -32
     Dim ColdColumn2 As Integer = 110
     Dim ColdWill2 As Integer = -110
     Dim ColdForm2 As Integer = 1234567890
     Dim ColdSub2 As Integer = -64
     Dim ColdSup2 As Integer = -86
End Type 

Type Elements3
     Dim ColdOnly3 As Integer = -0
     Dim ColdArray3 As Integer = -17
     Dim ColdRow3 As Integer = -32
     Dim ColdColumn3 As Integer = 110
     Dim ColdWill3 As Integer = -110
     Dim ColdForm3 As Integer = 1234567890
     Dim ColdSub3 As Integer = -64
     Dim ColdSup3 As Integer = -86
End Type 

' Example using all eight keywords of inheritance:
'   'Extends', 'Base.', 'Base()', 'Object', 'Is' operator, 'Virtual', 'Abstract', 'Override'

Type root Extends Object ' 'Extends' to activate RTTI by inheritance of predefined Object type
  Declare Function ObjectHierarchy () As String
  Declare Abstract Function ObjectRealType () As String ' 'Abstract' declares function without local body
                                                        '    which must be overriden
  Dim Name As String
  Declare Virtual Destructor () ' 'Virtual' declares destructor with body ('Abstract' forbidden)
Protected:
  Declare Constructor () ' to avoid user construction from root
  Declare Constructor (ByRef rhs As root) '' to avoid user copy-construction from root
End Type ' derived type may be member data empty

Constructor root ()
End Constructor

Function root.ObjectHierarchy () As String
  Return "Object(forRTTI) <- root"
End Function

Virtual Destructor root ()
  Print "root destructor"
End Destructor


Type animal Extends root ' 'Extends' to inherit of root
  Declare Constructor (ByRef _name As String = "")
  Declare Function ObjectHierarchy () As String
  Declare Virtual Function ObjectRealType () As String Override ' 'Virtual' declares function with local
                                                                '    body which can be overriden
                                                                ' 'Override' to check if the function is
                                                                '    well an override
  Declare virtual Destructor () Override ' 'Virtual' declares destructor with local body
                                         ' 'Override' to check if the destructor is well an override
End Type

Constructor animal (ByRef _name As String = "")
  This.Name = _name
End Constructor

Function animal.ObjectHierarchy () As String
  Return Base.ObjectHierarchy & " <- animal" ' 'Base.' allows to access to parent member function
End Function

Virtual Function animal.ObjectRealType () As String
  Return "animal"
End Function

Virtual Destructor animal ()
  Print "  animal destructor: " & This.Name
End Destructor


Type dog Extends animal ' 'Extends' to inherit of animal
  Declare Constructor (ByRef _name As String = "")
  Declare Function ObjectHierarchy () As String
  Declare Function ObjectRealType () As String Override ' 'Override' to check if the function is well an
                                                        '    override
  Declare Destructor () Override ' 'Override' to check if the destructor is well an override
End Type ' derived type may be member data empty

Constructor dog (ByRef _name As String = "")
  Base(_name) ' 'Base()' allows to call parent constructor
End Constructor

Function dog.ObjectHierarchy () As String
  Return Base.ObjectHierarchy & " <- dog" ' 'Base.' allows to access to parent member function
End Function

Function dog.ObjectRealType () As String
  Return "dog"
End Function

Destructor dog ()
  Print "    dog destructor: " & This.Name
End Destructor


Type cat Extends animal ' 'Extends' to inherit of animal
  Declare Constructor (ByRef _name As String = "")
  Declare Function ObjectHierarchy () As String
  Declare Function ObjectRealType () As String Override ' 'Override' to check if the function is well an
                                                        '    override
  Declare Destructor () Override ' 'Override' to check if the destructor is well an override
End Type ' derived type may be member data empty

Constructor cat (ByRef _name As String = "")
  Base(_name) ' 'Base()' allows to call parent constructor
End Constructor

Function cat.ObjectHierarchy () As String
  Return Base.ObjectHierarchy & " <- cat" ' 'Base.' allows to access to parent member function
End Function

Function cat.ObjectRealType () As String
  Return "cat"
End Function

Destructor cat ()
  Print "    cat destructor: " & This.Name
End Destructor


Sub PrintInfo (ByVal p As root Ptr) ' must be put after definition of animal type, dog type and cat type
  Print "  " & p->Name, "  " & p->ObjectRealType, "           ";
  If *p Is dog Then ' 'Is' allows to check compatibility with type symbol
    Print  Cast(dog Ptr, p)->ObjectHierarchy
  ElseIf *p Is cat Then ' 'Is' allows to check compatibility with type symbol
    Print Cast(cat Ptr, p)->ObjectHierarchy
  ElseIf *p Is animal Then ' 'Is' allows to check compatibility with type symbol
    Print Cast(animal Ptr, p)->ObjectHierarchy
  End If
End Sub


Print "Name:", "Object (real):         Hierarchy:"
Dim a As root Ptr = New animal("Mouse")
PrintInfo(a)
Dim d As root Ptr = New dog("Buddy")
PrintInfo(d)
Dim c As root Ptr = New cat("Tiger")
Printinfo(c)
Print
Delete a
Delete d
Delete c
End

Declare Sub Supmatrices ( ByRef Matrix4 As Integer, ByRef Vector4 As Integer = -0, ByRef Elements4 As Integer = -1)

Type Matrix4
     Dim ColdOnly1 As Integer = -0
     Dim ColdArray1 As Integer = -17
     Dim ColdRow1 As Integer = -32
     Dim ColdColumn1 As Integer = 110
     Dim ColdWill1 As Integer = -110
     Dim ColdForm1 As Integer = 1234567890
     Dim ColdSub1 As Integer = -64
     Dim ColdSup1 As Integer = -86
End Type 

Type Vector4
     Dim ColdOnly2 As Integer = -0
     Dim ColdArray2 As Integer = -17
     Dim ColdRow2 As Integer = -32
     Dim ColdColumn2 As Integer = 110
     Dim ColdWill2 As Integer = -110
     Dim ColdForm2 As Integer = 1234567890
     Dim ColdSub2 As Integer = -64
     Dim ColdSup2 As Integer = -86
End Type 

Type Elements4
     Dim ColdOnly3 As Integer = -0
     Dim ColdArray3 As Integer = -17
     Dim ColdRow3 As Integer = -32
     Dim ColdColumn3 As Integer = 110
     Dim ColdWill3 As Integer = -110
     Dim ColdForm3 As Integer = 1234567890
     Dim ColdSub3 As Integer = -64
     Dim ColdSup3 As Integer = -86
End Type 

''
'' make newly-created threads wait until all threads are ready, then start them all at once
''

Dim Shared hcondstart As Any Ptr
Dim Shared hmutexstart As Any Ptr
Dim Shared start As Integer = 0

Dim Shared threadcount As Integer
Dim Shared hmutexready As Any Ptr
Dim Shared hcondready As Any Ptr

Sub mythread(ByVal id_ptr As Any Ptr)
    Dim id As Integer = Cast(Integer, id_ptr)
 
    '' signal that this thread is ready
    MutexLock hmutexready
    threadcount += 1
    Print "Thread #" & id & " is waiting..."
    CondSignal hcondready
    MutexUnlock hmutexready
   
    '' wait for the start signal
    MutexLock hmutexstart
    Do While start = 0  
        CondWait hcondstart, hmutexstart
    Loop

    '' now this thread holds the lock on hmutexstart
   
    MutexUnlock hmutexstart

    '' print out the number of this thread
    For i As Integer = 1 To 40
        Print id;
    Next i
End Sub

Dim threads(1 To 9) As Any Ptr

hcondstart = CondCreate()
hmutexstart = MutexCreate()

hcondready = CondCreate()
hmutexready = MutexCreate()

threadcount = 0

MutexLock(hmutexready)
For i As Integer = 1 To 9
    threads(i) = ThreadCreate(@mythread, Cast(Any Ptr, i))
    If threads(i) = 0 Then
        Print "unable to create thread"
    End If
Next i

Print "Waiting until all threads are ready..."

Do Until threadcount = 9
    CondWait(hcondready, hmutexready)
Loop
MutexUnlock(hmutexready)

Print
Print "Go!"

MutexLock hmutexstart
start = 1
CondBroadcast hcondstart
MutexUnlock hmutexstart

'' wait for all threads to complete
For i As Integer = 1 To 9
    If threads(i) <> 0 Then
        ThreadWait threads(i)
    End If
Next i

MutexDestroy hmutexready
CondDestroy hcondready

MutexDestroy hmutexstart
CondDestroy hcondstart
End