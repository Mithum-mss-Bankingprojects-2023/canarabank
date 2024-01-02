-- DimStudent

Merge into dbo.DimStudent with (holdlock) as tgt
using ekctcore.dbo.student as src
on tgt.studentid = src.studentid
WHEN NOT MATCHED BY TARGET -- nothing in target
Then 
     Insert (

			[StudentID],
			[ApplicantID],
			[CreatedDate],
			[ModifiedDate],
			[CreatedBy] ,
			[ModifiedBy],
			[Status] ,
			[StatusChangeDate]  

            )
    Values (

		    [StudentID],
			[ApplicantID],
			[CreatedDate],
			[ModifiedDate],
			[CreatedBy] ,
			[ModifiedBy],
			[Status] ,
			[StatusChangeDate]

	       );
go


