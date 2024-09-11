// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract Task_ToDoList{

    enum Stat {Pending, Active, Inactive, Completed}
    enum Pri {Low, Medium, High}

    struct List{
        uint ID;
        string Description;
        Stat _Stat; //Status
        string Catg; //Category
        Pri _pri; //Priority
        uint due_date;
    }
      
        List l;
        List[] L;
    
    function AddTask(uint _id, string memory _description, Stat _stat, string memory _catg, Pri _pri, uint due_date) public {
        l.ID = _id; 
        l.Description = _description;
        l._Stat = _stat;
        l.Catg = _catg;
        l._pri = _pri;
        l.due_date = due_date;
        L.push(l);
    }

    function RemoveTask(uint _id) public {
        for (uint i=0; i <= L.length ; i++) 
        {
            if (_id == L[i].ID) {
                for (uint k=i; k < L.length -1; k++) 
                {
                    L[k] = L[k+1];
                }
            }
        }
        L.pop();
        revert("ID not found");
    }

    function Change_Status(uint _id, Stat x) public {
        for (uint i=0; i < L.length ; i++) 
        {
            if (_id == L[i].ID) {
                L[i]._Stat = x;
                return;
            }
        }
        revert("ID not found");
    }

    function Change_Priority(uint _id, Pri x) public {
        for (uint i=0; i < L.length ; i++) 
        {
            if (_id == L[i].ID) {
                L[i]._pri = x;
                return;
            }
        }
        revert("ID not found");
    }

    function Sort_on_Priority() public {
        List memory temp;
        for (uint i=0; i < L.length; i++) 
        {
            if(L[i]._pri < L[i+1]._pri) {
                temp = L[i];
                L[i] = L[i+1];
                L[i+1] = temp;
            }
        }
    }

    function EditTask(uint _id, string memory des, string memory categ, uint d_d) public  { //This function allows user to edit only one or more required items according to the needs
        string memory a = "";
        uint b = 0;   
        if (keccak256(abi.encodePacked(des)) != keccak256(abi.encodePacked(a))) {
            for (uint i=0; i < L.length ; i++) 
            {
                
                if (_id == L[i].ID) {
                    L[i].Description = des;
                }
            }
        }

        if (keccak256(abi.encodePacked(categ)) != keccak256(abi.encodePacked(a))) {
            for (uint i=0; i < L.length ; i++) 
            {
                
                if (_id == L[i].ID) {
                    L[i].Catg = categ;
                }
            }
        }

        if (keccak256(abi.encodePacked(d_d)) != keccak256(abi.encodePacked(b))) {
            for (uint i=0; i < L.length ; i++) 
            {
                
                if (_id == L[i].ID) {
                    L[i].due_date = d_d;
                }
            }
        }
    }

    function Sort_on_Status() public {
        List memory temp;
        for (uint i=0; i < L.length; i++) 
        {
            if(L[i]._Stat < L[i+1]._Stat) {
                temp = L[i];
                L[i] = L[i+1];
                L[i+1] = temp;
            }
        }
    }

    function DisplayTask(uint _id) public view returns(List memory ) {
        for (uint i; i < L.length; i++) 
        {
            if (_id == L[i].ID) {
                return L[i];
            }
        }
        revert("ID not found");
    }

    function DisplayList() view public returns(List[] memory) {
        return L;
    }

}