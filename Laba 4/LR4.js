function Form_process(){
    const gname = document.forms["my_form"]["fname"].value;
    const gprice = document.forms["my_form"]["fprice"].value;
    const elem = document.getElementById("goods");
    if (!gname || !gprice){
        alert("Поля должны быть заполнены!");
    }
    else if (Search_double(elem, gname)){ 
        alert("Такой товар уже есть!");
    }
    else {
        Add_to_goods(gname, gprice); 
    }
    document.forms["my_form"]["fname"].value = '';
    document.forms["my_form"]["fprice"].value = '';
}

function Search_double(elem, name) {
    return !!Array.from(elem.children).find(element=>element.childNodes[0].innerText == name);
}

function Add_to_goods(name, price){
    const new_row = document.createElement("div");
    const new_name = document.createElement("div");
    const new_price = document.createElement("div");
    new_row.setAttribute("class", "my_row");
    new_row.setAttribute("onclick", "Put_in_basket(this)");
    new_price.setAttribute("class", "highlight");
    new_name.innerHTML = name;
    new_price.innerHTML = price;
    document.getElementById("goods").appendChild(new_row);
    new_row.appendChild(new_name);
    new_row.appendChild(new_price);
}

function Add_to_basket(name, price) {
    if (Search_double(document.getElementById("basket"), name)){
        Array.from(document.getElementById("basket").children).forEach(element => {
            if (element.childNodes[0].innerText == name) {
                //alert("Ok");
                let amount = parseInt(element.childNodes[2].textContent) + 1;
                element.childNodes[2].innerHTML = amount;
            }
        });
    } else {
        const new_row = document.createElement("div");
        const new_name = document.createElement("div");
        const new_price = document.createElement("div");
        const new_amount = document.createElement("div");
        new_row.setAttribute("class", "my_row");
        new_price.setAttribute("id", "pr");
        new_name.innerHTML = name;
        new_price.innerHTML = price;
        new_amount.innerHTML = "1";
        document.getElementById("basket").appendChild(new_row);
        new_row.appendChild(new_name);
        new_row.appendChild(new_price);
        new_row.appendChild(new_amount);
    }

}

function Put_in_basket(elem) {
    const gname = elem.childNodes[0].textContent;
    const gprice = elem.childNodes[1].textContent;
    Add_to_basket(gname, gprice);
}

function Get_cost(){
    const text = document.getElementById("cost");
    let value = 0;
    const basket = document.getElementById("basket");
    if (basket.hasChildNodes && basket.children.length >= 1) {
        for (let i = 1; i < basket.children.length; ++i) {
            value += parseInt(basket.children[i].childNodes[1].textContent)*parseInt(basket.children[i].childNodes[2].textContent);
        }
    } else {
        console.log("There is no children");
    }
    if (value > 0) { text.innerHTML = `Стоимость заказа = ${value} рублей`; }
    else { alert("Your basket is empty"); }
}