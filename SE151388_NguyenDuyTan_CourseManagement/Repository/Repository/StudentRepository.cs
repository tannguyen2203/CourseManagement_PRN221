﻿using Repository.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Repository
{
    public class StudentRepository : RepositoryBase<TblStudent>
    {
        public StudentRepository(CourseManagementContext context) : base(context)
        {
        }
    }
}
