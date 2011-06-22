using kata.junio.lists.nodes;

namespace kata.junio.lists.singlelinked
{
    public class List : IKataList
    {
        private ListNode _firstNode;

        public List()
        {
            _firstNode = null;
        }

        #region IKataList Members

        public string[] Values
        {
            get
            {
                if (_firstNode != null)
                    return _firstNode.GetValues(0);
                return new string[] { };
            }
        }

        public ListNode Find(string value)
        {
            if (_firstNode != null)
            {
                return _firstNode.Value == value ? _firstNode : _firstNode.FindNext(value);
            }
            return null;
        }

        public void Add(string value)
        {
            if (_firstNode == null)
                _firstNode = new SingleListNode(value);
            else
                _firstNode.PassNext(value);
        }

        public void Delete(ListNode listNode)
        {
            if (_firstNode != null)
            {
                if (listNode != null)
                {
                    if (_firstNode.Equals(listNode))
                        _firstNode = _firstNode.Next;
                    else
                    {
                        _firstNode.Delete(listNode);
                    }
                }
            }
        }

        #endregion IKataList Members
    }
}