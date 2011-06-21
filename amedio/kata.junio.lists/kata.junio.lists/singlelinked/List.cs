using System;
using kata.junio.lists.nodes;

namespace kata.junio.lists.singlelinked
{
    public class List : IKataList
    {
        #region IKataList Members

        public string[] Values
        {
            get { throw new NotImplementedException(); }
        }

        public ListNode Find(string value)
        {
            return null;
        }

        public void Add(string value)
        {
            throw new NotImplementedException();
        }

        public void Delete(ListNode listNode)
        {
            throw new NotImplementedException();
        }

        #endregion IKataList Members
    }
}