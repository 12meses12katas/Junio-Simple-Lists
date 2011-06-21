namespace kata.junio.lists.nodes
{
    public class SingleListNode : ListNode
    {
        public SingleListNode(string value)
        {
            this.Value = value;
        }

        public override void PassNext(string value)
        {
            if (Next == null)
                Next = new SingleListNode(value);
            else
            {
                Next.PassNext(value);
            }
        }

        public override ListNode FindNext(string value)
        {
            if (Next != null)
            {
                return Next.Value == value ? Next : Next.FindNext(value);
            }
            return null;
        }

        public override string[] GetValues(int pos)
        {
            string[] result = Next != null ? Next.GetValues(pos + 1) : new string[pos + 1];

            result[pos] = Value;
            return result;
        }

        public override void Delete(ListNode listNode)
        {
            if (Next != null)
            {
                if (listNode != null)
                {
                    if (Next.Equals(listNode))
                        Next = Next.Next;
                    else
                    {
                        Next.Delete(listNode);
                    }
                }
            }
        }
    }
}