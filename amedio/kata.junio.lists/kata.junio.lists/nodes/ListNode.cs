namespace kata.junio.lists.nodes
{
    public abstract class ListNode
    {
        public string Value { get; set; }

        public ListNode Next { get; set; }

        public abstract void PassNext(string value);

        public abstract ListNode FindNext(string value);

        public abstract string[] GetValues(int pos);

        public abstract void Delete(ListNode listNode);

        public override bool Equals(object obj)
        {
            return Value.Equals(((ListNode)obj).Value);
        }
    }
}