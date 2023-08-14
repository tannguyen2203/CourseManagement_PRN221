﻿using Repository.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Repository.Repository
{
    public class AttendenceRepository : RepositoryBase<TblAttendence>
    {
        public AttendenceRepository(CourseManagementContext context) : base(context)
        {
        }
    }
}
