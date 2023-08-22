using System;
using System.Collections.Generic;

#nullable disable

namespace CrouseManagement.Repository.Models
{
    public partial class Room
    {
        public Room()
        {
            Sessions = new HashSet<Session>();
            Status = 1;
        }

        public int Id { get; set; }
        public string RoomCode { get; set; }
        public string Detail { get; set; }
        public int? Status { get; set; }
        public string RoomName { get; set; }

        public virtual ICollection<Session> Sessions { get; set; }
    }
}
