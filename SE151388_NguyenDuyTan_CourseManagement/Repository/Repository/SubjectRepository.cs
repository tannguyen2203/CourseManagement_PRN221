using Repository.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Repository
{
    public class SubjectRepository : RepositoryBase<TblSubject>
    {
        public SubjectRepository(CourseManagementContext context) : base(context)
        {
        }
    }
}
