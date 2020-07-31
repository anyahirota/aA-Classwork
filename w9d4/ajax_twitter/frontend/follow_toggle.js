class FollowToggle { 
    constructor (el) { 
        console.log(el);
        this.$el  = $(el);
        this.userId = this.$el.data("user-id"); 
        this.initialFollowState = this.$el.data("initial-follow-state");
        this.render();
        this.$el.on("click", this.handleClick.bind(this));
    };

    render() {
        if (this.initialFollowState === "unfollowed") {
            this.$el.text("Follow!");
        } else {
            this.$el.text("Unfollow!");
        }  
    };

    handleClick() {
        event.preventDefault();
        let that = this; 
        if (this.initialFollowState === "unfollowed") { 
            $.ajax({
                method: 'POST', 
                url: `/users/${this.userId}/follow`, 
                dataType: 'json',
                success() {
                    that.initialFollowState = "followed";
                    that.render()
                },
            });
        } else { 
            $.ajax({ 
                method: 'DELETE', 
                url: `/users/${this.userId}/follow`,
                dataType: 'json', 
                success() { 
                    that.initialFollowState = "unfollowed"; 
                    that.render(); 
                }
            });
        }
    }
}



module.exports = FollowToggle; 