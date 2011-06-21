using kata.junio.lists.nodes;

namespace kata.junio.lists
{
    public interface IKataList
    {
        string[] Values
        {
            get;
        }

        ListNode Find(string value);

        void Add(string value);

        void Delete(ListNode listNode);
    }
}